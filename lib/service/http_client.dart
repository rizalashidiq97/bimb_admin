import 'package:bimbingan_kuy_admin/global_controller/controller/auth_controller.dart';
import 'package:bimbingan_kuy_admin/util/utitity/string_util.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClient extends DioForNative {
  GetStorage storage = GetStorage();
  Dio _newDio = Dio();

  CancelToken cancelToken = CancelToken();

  final bool withAuth;

  HttpClient({this.withAuth = true, BaseOptions options}) : super(options) {
    options.baseUrl = 'https://sibimbing.herokuapp.com/api';
    options.connectTimeout = 5000;
    options.receiveTimeout = 15000;
    options.responseType = ResponseType.json;
    _newDio.options = options;
    interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
    interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequestMethod,
        onResponse: (Response response) => response,
        onError: onErrorMethod,
      ),
    );
  }

  void lockRequest() {
    this.lock();
    this.interceptors.responseLock.lock();
    this.interceptors.errorLock.lock();
  }

  void unlockRequest() {
    this.unlock();
    this.interceptors.responseLock.unlock();
    this.interceptors.errorLock.unlock();
  }

  Future<RequestOptions> onRequestMethod(RequestOptions options) async {
    bool accessToken = storage.hasData(StringUtil.accessToken);

    options.cancelToken = cancelToken;
    print('>> START REQUEST');
    if (!accessToken && withAuth) {
      print('>> IF TOKEN IS NOT PROVIDED');
      Get.find<AuthController>().logout();
    }
    if (withAuth) {
      print('>> IF TOKEN IS PROVIDED BUT WITH AUTH');
      options.headers["Authorization"] =
          "Bearer ${storage.read(StringUtil.accessToken)}";
    }

    return options;
  }

  onErrorMethod(DioError error) async {
    if (error.response?.statusCode == 401 &&
        error.request.path != '/auth/login') {
      print('>> IF ERROR iS 401');
      RequestOptions options = error.response.request;

      String accessToken = "Bearer ${storage.read(StringUtil.accessToken)}";
      if (accessToken != options.headers['Authorization']) {
        print('>> IF HEADER IS NOT SAME AS ACCESSTOKEN');
        return this.request(options.path, options: options);
      }

      lockRequest();
      print('>> LOCK REQUEST OF AN OLD INSTANCE');

      try {
        print('>> START REQUEST REFRESH TOKEN');
        Response response = await _newDio.post(
          '/auth/refresh',
          options: Options(
            headers: {
              'Authorization': "Bearer ${storage.read(StringUtil.accessToken)}",
            },
          ),
        );

        print(
            '>>  REQUEST FOR REFRESH TOKEN : ${response.data['access_token']}');

        options.headers["Authorization"] =
            "Bearer ${response.data['access_token']}";
        Get.find<AuthController>().writeDatatoDisk(
          authModel: response.data,
          isRefreshToken: true,
        );

        unlockRequest();
        print('>>  CONTINUE TO REQUEST');
        return this.request(options.path, options: options);
      } on DioError catch (e) {
        print('>> DIO ERROR REFRESH TOKEN');
        unlockRequest();

        print('>>  UNLOCK OLD INSTANCE');
        Get.find<AuthController>().logout();
        throw DioError(
          error: 'Token not found. Please do Login.',
          type: DioErrorType.RESPONSE,
          response: e.response,
        );
      } catch (e) {
        print('>>  REFRESH TOKEN ERROR');
        unlockRequest();
        print('>>  UNLOCK OLD INSTANCE');
        throw e;
      }
    }
    return error;
  }
}
