import 'package:bimbingan_kuy_admin/global_widget/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'splash_screen_widget/logo_splash.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BackgroundImage(),
            Column(
              children: <Widget>[
                LogoLoginonSplashScreen(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(20)),
                  child: Text(
                    '\u00a9 FSM Universitas Diponegoro',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
