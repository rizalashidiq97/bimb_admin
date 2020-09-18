import 'dart:convert';

import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:bimbingan_kuy_admin/service/auth_service.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthService authService;
  AuthController({this.authService});

  RxString _token = ''.obs;
  Rx<AuthData> authData = AuthData().obs;

  String get token => _token.value == '' ? null : _token.value;

  @override
  void onInit() => setDataFromDisk();

  setDataFromDisk() {
    final hasToken = GetStorage().hasData(StringUtil.accessToken);
    if (hasToken) {
      _token.value = GetStorage().read<String>(StringUtil.accessToken);
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
    _token.value = authModel.accessToken ?? _token.value;
    if (authModel != null && isRefreshToken == null) {
      print('>>  WRITE DATA MODEL');
      GetStorage().write(StringUtil.authData, json.encode(authModel.toMap()));
      authData.value = AuthData(
        name: authModel.user.name,
        email: authModel.user.email,
        id: authModel.user.id,
      );
    }
  }

  Future<bool> login() async {
    try {
      final response = await authService.loginService();

      int roleIndex =
          response.user.roles.indexWhere((data) => data.name == 'admin');
      if (roleIndex != -1) {
        writeDatatoDisk(authModel: response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    print('>>  LOGOUT');
    GetStorage().erase();
    _token.value = null;
    authData.value = AuthData();
    print('value token : ${GetStorage().read(StringUtil.accessToken)}');
    print('value authData : ${GetStorage().read(StringUtil.authData)}');
    Get.offAllNamed(NameRoutes.login);
  }
}
