import 'package:bimbingan_kuy_admin/global_widget/hero_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoonSplashScreen extends StatelessWidget {
  const LogoonSplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageHeroSIBIMBING(
            tag: 'LogoLogin',
            image: 'assets/images/sibimbing_with_text.png',
            height: ScreenUtil().setHeight(200.0),
            width: ScreenUtil().setHeight(200.0),
          ),
        ],
      ),
    );
  }
}
