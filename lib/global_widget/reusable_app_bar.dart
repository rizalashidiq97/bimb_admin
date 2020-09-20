import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final List<Widget> actions;

  const ReusableAppBar({
    Key key,
    this.titleText,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleText,
        style: TextStyle(fontSize: ScreenUtil().setSp(40)),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
