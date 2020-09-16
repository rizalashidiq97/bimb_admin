import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../util/extension/dioError_extension.dart';

class AuthService {
  final Dio dio;
  final Dio diowithoutAuth;
  AuthService({this.diowithoutAuth, this.dio});

  CancelToken initcancelToken;

  Future<NetworkAuthModel> loginService() async {
    final loginData = Get.find<LoginController>().loginData;
    initcancelToken = CancelToken();

    try {
      Response response = await diowithoutAuth.post(
        '/auth/login',
        cancelToken: initcancelToken,
        data: {
          'email': loginData.email,
          'password': loginData.password,
        },
      );
      return NetworkAuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }
}
