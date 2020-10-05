import 'package:bimbingan_kuy_admin/app/authenticated/settings/change_password/change_password_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/reusable_app_bar.dart';
import 'package:bimbingan_kuy_admin/global_widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/extension/context_extension.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unFocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableAppBar(
          titleText: 'Ubah Password',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetX<ChangePasswordController>(
                builder: (ctrl) => TextFormWidget(
                  obsecureText: true,
                  label: 'Password lama',
                  errorText: ctrl?.passwordLamaerror,
                  onChange: (val) => ctrl.setPasswordLama(val),
                ),
              ),
              GetX<ChangePasswordController>(
                builder: (ctrl) => TextFormWidget(
                  obsecureText: true,
                  label: 'Password baru',
                  errorText: ctrl?.passwordBaruerror,
                  onChange: (val) => ctrl.setPasswordBaru(val),
                ),
              ),
              GetX<ChangePasswordController>(
                builder: (ctrl) {
                  return TextFormWidget(
                    obsecureText: true,
                    label: 'Konfirmasi password',
                    errorText: ctrl?.konfirmasiError,
                    onChange: (val) => ctrl.setKonfirmasiPassword(val),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: GetX<ChangePasswordController>(
                  builder: (ctrl) {
                    return RaisedButton(
                      onPressed:
                          ctrl.isAllowebSubmit ? () => ctrl.submit() : null,
                      color: Get.theme.accentColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setHeight(40),
                          vertical: ScreenUtil().setWidth(30)),
                      textColor: Colors.white,
                      disabledTextColor: Colors.white.withAlpha(180),
                      disabledColor: Get.theme.accentColor.withAlpha(180),
                      elevation: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("PROSES"),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
