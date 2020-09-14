import 'dart:convert';

import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_model/login_model.dart';
import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:bimbingan_kuy_admin/service/auth_service.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/utitity/string_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthService authService;
  AuthController({this.authService});

  Rx<String> token = null.obs;
  Rx<AuthData> authData = AuthData().obs;

  @override
  void onInit() => setDataFromDisk();

  setDataFromDisk() {
    final hasToken = GetStorage().hasData(StringUtil.accessToken);
    if (hasToken) {
      token.value = GetStorage().read<String>(StringUtil.accessToken);
      final authUser =
          json.decode(GetStorage().read<String>(StringUtil.authData))
              as Map<String, dynamic>;

      authData.value = AuthData(
        email: authUser['email'],
        name: authUser['name'],
        id: authUser['userId'],
      );
    }
  }

  writeDatatoDisk({bool isRefreshToken, NetworkAuthModel authModel}) {
    print('>>  WRITE DATA TO DISK');
    GetStorage().write(StringUtil.accessToken, authModel.accessToken);
    token.value = authModel.accessToken ?? token.value;
    if (authModel != null && isRefreshToken == false) {
      GetStorage().write(StringUtil.authData, json.encode(authModel.toMap()));
      authData.value = AuthData(
        name: authModel.user.name,
        email: authModel.user.email,
        id: authModel.user.id,
      );
    }
  }

  Future<bool> login(LoginData loginData) async {
    try {
      final response = await authService.loginService(loginData);
      writeDatatoDisk(authModel: response);
      return true;
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    print('>>  LOGOUT');
    GetStorage().erase();
    token.value = null;
    authData.value = AuthData();
    Get.offAllNamed(NameRoutes.login);
  }
}
