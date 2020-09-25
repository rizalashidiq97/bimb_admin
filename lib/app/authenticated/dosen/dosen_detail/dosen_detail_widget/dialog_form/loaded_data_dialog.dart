import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/select_form_controller.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contentOption_dep.dart';
import 'contentOption_roles.dart';

class LoadedDataDialog extends StatelessWidget {
  const LoadedDataDialog({
    Key key,
    @required this.formFor,
  }) : super(key: key);

  final FormFor formFor;

  @override
  Widget build(BuildContext context) {
    final SelectFormController controller = Get.find();
    if (formFor == FormFor.departemen) {
      return WillPopScope(
        onWillPop: () => controller.goBackFromDepartemenOnWillPop(),
        child: SimpleDialog(
          title: Text('Pilih Departemen'),
          children: controller.listDepartemen
              .map((data) => ContentOptionDepartemen(data: data))
              .toList(),
        ),
      );
    } else {
      return WillPopScope(
        onWillPop: () => controller.goBackFromRolesOnWillPop(),
        child: AlertDialog(
          title: Text('Pilih Hak Akses', style: Get.textTheme.headline6),
          titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          contentPadding: EdgeInsets.only(top: 12.0),
          content: SingleChildScrollView(
            child: ListTileTheme(
              contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
              child: ListBody(
                children: controller.listRoles
                    .map((data) => ContentOptionRoles(data: data))
                    .toList(),
              ),
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Batal'),
              onPressed: () => controller.goBackFromRoles(cancel: true),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () => controller.goBackFromRoles(),
            )
          ],
        ),
      );
    }
  }
}
