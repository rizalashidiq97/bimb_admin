import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/select_form_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Role.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentOptionRoles extends StatelessWidget {
  final Role data;
  const ContentOptionRoles({
    this.data,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectFormController controller = Get.find();
    return Obx(
      () {
        final role =
            controller.listRoles.firstWhere((el) => el.name == data.name);
        return CheckboxListTile(
          value: role?.checked,
          title: Text(role?.name),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (val) => controller.onChangeRoles(data, val),
        );
      },
    );
  }
}
