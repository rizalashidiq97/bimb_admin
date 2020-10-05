import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_controller/dialog_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DialogFormDepartemen extends StatelessWidget {
  final Departemen departemen;
  const DialogFormDepartemen(this.departemen);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DialogDepartemenController>(
      init: DialogDepartemenController(departemen),
      builder: (controller) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(controller.textButton, style: Get.textTheme.headline6),
          titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          contentPadding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<DialogDepartemenController>(
                dispose: (_) => controller.dispose(),
                id: 'updateText',
                builder: (_) => TextFormWidget(
                  autoFocus: true,
                  label: 'Departemen',
                  border: false,
                  controller: controller.textController,
                  errorText: controller.errorText,
                  onChange: (val) => controller.setValidaton(val),
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () => Get.back(),
              child: Text(
                'Batal',
                style: TextStyle(color: Get.theme.accentColor),
              ),
            ),
            Container(
              child: GetBuilder<DialogDepartemenController>(
                id: 'submit',
                builder: (_) => RaisedButton(
                  onPressed: controller.isAllowedSubmit
                      ? () => Get.back(result: controller.departemenData)
                      : null,
                  color: Get.theme.accentColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(30),
                      vertical: ScreenUtil().setWidth(20)),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
