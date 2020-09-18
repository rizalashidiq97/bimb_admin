import 'package:bimbingan_kuy_admin/global_controller/controller/auth_controller.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClient {
  GetStorage storage = GetStorage();
  Dio _newDio = Dio();
  Dio dio = Dio();

  final bool withAuth;

  HttpClient({this.withAuth = true}) {
    dio.options.baseUrl = 'https://sibimbing.herokuapp.com/api';
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 15000;
    dio.options.responseType = ResponseType.json;
    _newDio.options = dio.options;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequestMethod,
        onResponse: (Response response) => response,
        onError: onErrorMethod,
      ),
    );
  }

  bool excludedPath(DioError error) {
    return error.request.path != '/auth/login';
  }

  void lockRequest() {
    dio.lock();
    dio.interceptors.responseLock.lock();
    dio.interceptors.errorLock.lock();
  }

  void unlockRequest() {
    dio.unlock();
    dio.interceptors.responseLock.unlock();
    dio.interceptors.errorLock.unlock();
  }

  Future<RequestOptions> onRequestMethod(RequestOptions options) async {
    bool accessToken = storage.hasData(StringUtil.accessToken);

    print('>> START REQUEST');
    if (!accessToken && withAuth) {
      print('>> IF TOKEN IS NOT PROVIDED');
      Get.find<AuthController>().logout();
    }
    if (withAuth) {
      print('>> IF TOKEN IS PROVIDED BUT WITH AUTH');
      options.headers["authorization"] =
          "Bearer ${storage.read(StringUtil.accessToken)}";
    }
    return options;
  }

  onErrorMethod(DioError error) async {
    if (error.response?.statusCode == 401 && excludedPath(error)) {
      print('>> IF ERROR iS 401');
      RequestOptions options = error.response.request;

      String accessToken = "Bearer ${storage.read(StringUtil.accessToken)}";
      if (accessToken != options.headers['authorization']) {
        print('>> IF HEADER IS NOT SAME AS ACCESSTOKEN');
        return dio.request(options.path, options: options);
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
        return dio.request(options.path, options: options);
      } on DioError catch (e) {
        String message;
        print('>> DIO ERROR REFRESH TOKEN');
        unlockRequest();

        print('>>  UNLOCK OLD INSTANCE');
        if (e.response?.statusCode == 401) {
          Get.find<AuthController>().logout();
          message = 'Token not provided';
        } else {
          message = e.response.statusMessage;
        }

        throw DioError(
          error: message,
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
