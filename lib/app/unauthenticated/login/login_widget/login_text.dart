import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(40),
        vertical: ScreenUtil().setHeight(40),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: Colors.grey[200],
      ),
      width: double.infinity,
      child: Text(
        'LOGIN',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
            fontSize: ScreenUtil().setSp(35)),
      ),
    );
  }
}
