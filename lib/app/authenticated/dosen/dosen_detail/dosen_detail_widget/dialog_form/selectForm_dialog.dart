import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/select_form_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/dialog_widget.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'failed_or_null_dialog.dart';
import 'loaded_data_dialog.dart';

class SelectFormDialog extends StatelessWidget {
  final FormFor formFor;

  const SelectFormDialog({Key key, this.formFor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectFormController>(
      init: SelectFormController(formFor: formFor),
      builder: (controller) => Obx(
        () {
          final status = controller.networkStates.value;
          if (status == NetworkStates.loading) {
            return LoadingDialog();
          } else if (status == NetworkStates.failed) {
            return FailedOrNullDialog(error: controller.errorNetwork);
          } else {
            if (formFor == FormFor.departemen &&
                controller.listDepartemen.isEmpty) {
              return FailedOrNullDialog(error: 'Data saat ini masih kosong');
            }

            return LoadedDataDialog(formFor: formFor);
          }
        },
      ),
    );
  }
}
