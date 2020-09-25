import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/select_form_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContentOptionDepartemen extends StatelessWidget {
  final Departemen data;
  const ContentOptionDepartemen({
    this.data,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectFormController controller = Get.find();
    return SimpleDialogOption(
      onPressed: () => Get.back(result: data),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(data.nama),
            controller.isCheckedDepartemen(data.id)
                ? Icon(Icons.check, color: Get.theme.accentColor)
                : Container(),
          ],
        ),
      ),
    );
  }
}
