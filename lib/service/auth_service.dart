import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_model/login_model.dart';
import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:dio/dio.dart';
import '../util/extension/dioError_extension.dart';

import 'http_client.dart';

class AuthService {
  final HttpClient dio;
  final HttpClient diowithoutAuth;

  AuthService({this.diowithoutAuth, this.dio});

  Future<NetworkAuthModel> loginService(LoginData loginData) async {
    try {
      Response response = await diowithoutAuth.post('/auth/login');
      return NetworkAuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }
}
