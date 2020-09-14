import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_widget/login_form.dart';
import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_widget/login_submit.dart';
import 'package:bimbingan_kuy_admin/global_widget/hero_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_text.dart';

class BuildContentLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageHeroSIBIMBING(
                tag: 'LogoLogin',
                image: 'assets/images/sibimbing.png',
                height: ScreenUtil().setHeight(150.0),
                width: ScreenUtil().setWidth(150.0),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(70),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                elevation: 3,
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [TextLogin(), LoginForm(), LoginSubmit()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
