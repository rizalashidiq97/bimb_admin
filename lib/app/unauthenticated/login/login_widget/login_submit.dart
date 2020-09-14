import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../login_controller.dart';

class LoginSubmit extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(40),
        horizontal: ScreenUtil().setWidth(30),
      ),
      child: Obx(() {
        return RaisedButton(
          onPressed: loginController.isAllowedSubmit
              ? () => loginController.submittoLogin()
              : null,
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setHeight(40),
              vertical: ScreenUtil().setWidth(30)),
          textColor: Colors.white,
          disabledTextColor: Colors.white.withAlpha(180),
          disabledColor: Theme.of(context).accentColor.withAlpha(180),
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("MASUK"),
              Icon(Icons.arrow_forward),
            ],
          ),
        );
      }),
    );
  }
}
