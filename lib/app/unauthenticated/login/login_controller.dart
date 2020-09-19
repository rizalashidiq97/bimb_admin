import 'package:bimbingan_kuy_admin/global_controller/controller/auth_controller.dart';
import 'package:bimbingan_kuy_admin/service/auth_service.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/GetXhelper.dart';
import 'package:bimbingan_kuy_admin/service/dialog_widget.dart';
import 'package:bimbingan_kuy_admin/util/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_model/login_model.dart';

class LoginController extends GetxController {
  final focusPassword = FocusNode();
  LoginData loginData = LoginData();
  RxString _errorPasswordmsg = ''.obs;
  RxString _errorEmailmsg = ''.obs;
  RxBool _isPasswordError = true.obs;
  RxBool _isEmailError = true.obs;

  bool get isAllowedSubmit => !_isPasswordError.value && !_isEmailError.value;
  String get emailError =>
      _errorEmailmsg.value == '' ? null : _errorEmailmsg.value;
  String get passwordError =>
      _errorPasswordmsg.value == '' ? null : _errorPasswordmsg.value;

  void setEmail(String value) {
    if (value.isEmpty) {
      _isEmailError.value = true;
      _errorEmailmsg.value = 'Email'.isRequired;
    } else if (!value.isEmail) {
      _isEmailError.value = true;
      _errorEmailmsg.value = 'email'.isInvalidFormat;
    } else {
      _isEmailError.value = false;
      _errorEmailmsg.value = null;
    }
    loginData = loginData.copyWith(email: value);
  }

  void setPassword(String value) {
    if (value.isEmpty) {
      _isPasswordError.value = true;
      _errorPasswordmsg.value = 'Password'.isRequired;
    } else if (value.length < 8) {
      _isPasswordError.value = true;
      _errorPasswordmsg.value = 'Password'.lengthMustBeOrGreaterThan(8);
    } else {
      _isPasswordError.value = false;
      _errorPasswordmsg.value = null;
    }
    loginData = loginData.copyWith(password: value);
  }

  Future<void> submittoLogin() async {
    Get.dialog(
      LoadingDialog(
        cancelCallback: () => Get.find<AuthService>().cancelToken?.cancel(),
      ),
    );
    try {
      final response = await Get.find<AuthController>().login();
      Get.back();
      if (response) {
        Get.offNamed(NameRoutes.dummy);
      } else {
        Helper.defaultSnackBarError('User dan password tidak valid');
      }
    } catch (e) {
      Get.back();
      Helper.defaultSnackBarError(e);
    }
  }

  void dispose() {
    focusPassword.dispose();
  }
}
