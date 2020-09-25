import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_validation_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/textfield.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog_form/selectForm_dialog.dart';

class SelectDepartemen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DosenDetailController controller = Get.find();
    return Obx(
      () => TextFormWidget(
        onTap: showDialogDepartemen,
        readOnly: true,
        label: 'Departemen',
        controller: controller.departemenController,
        errorText: controller.getValidationOf.validator.value?.departemenError,
      ),
    );
  }

  void showDialogDepartemen() {
    Get.dialog(SelectFormDialog(formFor: FormFor.departemen)).then((value) =>
        Get.find<DosenValidationController>().validateDepartemen(value));
  }
}
