import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_widget/login_content.dart';
import 'package:bimbingan_kuy_admin/global_widget/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../util/extension/context_extension.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    ScreenUtil.init(context, width: 750, height: 1334);

    return GestureDetector(
      onTap: () => context.unFocus(),
      child: Scaffold(
        body: GetBuilder(
          dispose: (state) => loginController.dispose(),
          builder: (_) => Stack(
            fit: StackFit.expand,
            children: [BackgroundImage(), BuildContentLogin()],
          ),
        ),
      ),
    );
  }
}
