import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../dosen_detail_controller/dosen_detail_controller.dart';

class SubmitFormCRUDDosen extends StatelessWidget {
  const SubmitFormCRUDDosen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DosenDetailController controller = Get.find();
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      child: Obx(() {
        return RaisedButton(
          onPressed: controller.getValidationOf.allowedSubmit
              ? () => controller.submitForm()
              : null,
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
      }),
    );
  }
}
