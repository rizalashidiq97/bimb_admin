import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(30),
        horizontal: ScreenUtil().setHeight(30),
      ),
      child: Column(
        children: [
          Obx(
            () => TextFormWidget(
              label: 'Email',
              icon: Icon(Icons.person),
              nextfocusNode: loginController.focusPassword,
              errorText: loginController.errorEmailmsg.value,
              onChange: (value) => loginController.setEmail(value),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          Obx(
            () => TextFormWidget(
              focusNode: loginController.focusPassword,
              obsecureText: true,
              label: 'Password',
              icon: Icon(Icons.lock),
              errorText: loginController.errorPasswordmsg.value,
              onChange: (value) => loginController.setPassword(value),
            ),
          ),
        ],
      ),
    );
  }
}
