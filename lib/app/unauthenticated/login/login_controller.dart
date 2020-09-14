import 'package:bimbingan_kuy_admin/global_controller/controller/auth_controller.dart';
import 'package:bimbingan_kuy_admin/global_controller/interface/cancel_interface.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_model/login_model.dart';

class LoginController extends GetxController with ICancellableOperation {
  final focusPassword = FocusNode();
  Rx<LoginData> _loginData = LoginData().obs;
  Rx<String> errorPasswordmsg = null.obs;
  Rx<String> errorEmailmsg = null.obs;
  RxBool isPasswordError = true.obs;
  RxBool isEmailError = true.obs;

  bool get isAllowedSubmit => !isPasswordError.value && !isEmailError.value;

  void setEmail(String value) {
    if (value.isEmpty) {
      isEmailError.value = true;
      errorEmailmsg.value = 'Email tidak boleh kosong';
    } else if (value.isEmail) {
      isEmailError.value = true;
      errorEmailmsg.value = 'Format Email tidak valid';
    } else {
      isEmailError.value = false;
      errorEmailmsg.value = null;
    }
    _loginData.value = _loginData.value.copyWith(email: value);
  }

  void setPassword(String value) {
    if (value.isEmpty) {
      isPasswordError.value = true;
      errorPasswordmsg.value = 'Password tidak boleh kosong';
    } else if (value.length < 8) {
      isPasswordError.value = true;
      errorPasswordmsg.value = 'Password tidak boleh kurang dari 8 karakter';
    } else {
      isPasswordError.value = false;
      errorPasswordmsg.value = null;
    }
    _loginData.value = _loginData.value.copyWith(password: value);
  }

  Future<void> submittoLogin() async {
    Get.defaultDialog(
      title: 'Tunggu',
      textCancel: 'Batalkan',
      middleText: 'Tunggu sebentar',
      onCancel: () => cancel(),
    );
    try {
      final response = await Get.find<AuthController>().login(_loginData.value);
      if (response) {
        Get.toNamed(NameRoutes.home);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          icon: Icon(Icons.cancel),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.GROUNDED);
    }
  }

  void dispose() {
    focusPassword.dispose();
  }
}
