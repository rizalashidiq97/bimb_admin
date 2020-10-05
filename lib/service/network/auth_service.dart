import 'package:bimbingan_kuy_admin/app/authenticated/settings/change_password/change_password_model.dart';
import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:bimbingan_kuy_admin/util/utility/http_exception.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../util/extension/dioError_extension.dart';

class AuthService {
  final Dio dio;
  final Dio diowithoutAuth;
  AuthService({this.diowithoutAuth, this.dio});

  CancelToken cancelToken;

  Future<NetworkAuthModel> loginService() async {
    final loginData = Get.find<LoginController>().loginData;
    cancelToken = CancelToken();

    try {
      Response response = await diowithoutAuth.post(
        '/auth/login',
        cancelToken: cancelToken,
        data: loginData.toMap(),
      );

      return NetworkAuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }

  Future<void> changePasswordService(
    String passwordLama,
    String passwordBaru,
    String konfirmasiPassword,
  ) async {
    try {
      await dio.post(
        '/user/update-password',
        data: {
          "password": passwordLama,
          "new_password": passwordBaru,
          "new_password_confirmation": konfirmasiPassword
        },
      );
    } on DioError catch (e) {
      if (e.response.statusCode == 422) {
        throw FormValidationErrorException<PasswordErrorModel>(
          PasswordErrorModel.fromJson(e.response.data['errors']),
        );
      } else {
        throw e.withMessage();
      }
    } catch (e) {
      throw e;
    }
  }
}
