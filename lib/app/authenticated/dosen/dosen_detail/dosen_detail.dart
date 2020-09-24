import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/reusable_app_bar.dart';
import 'package:bimbingan_kuy_admin/global_widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dosen_detail_widget/multi_select_form.dart';
import 'dosen_detail_widget/select_departemen.dart';
import 'dosen_detail_widget/submit_button.dart';
import '../../../../util/extension/context_extension.dart';

class DosenDetail extends StatelessWidget {
  final DosenDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unFocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableAppBar(titleText: controller.appBarTitle),
        body: GetBuilder(
          dispose: (_) => controller.dispose(),
          builder: (_) => SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => TextFormWidget(
                    nextfocusNode: controller.emailFocusNode,
                    label: 'Nama',
                    controller: controller.namaController,
                    onChange: controller.getValidationOf.validateName,
                    errorText:
                        controller.getValidationOf.validator.value?.namaError,
                  ),
                ),
                Obx(
                  () => TextFormWidget(
                    keyboard: TextInputType.emailAddress,
                    focusNode: controller.emailFocusNode,
                    nextfocusNode: controller.kodeBimbingFocusNode,
                    label: 'Email',
                    controller: controller.emailController,
                    onChange: controller.getValidationOf.validateEmail,
                    errorText:
                        controller.getValidationOf.validator.value?.emailError,
                  ),
                ),
                Obx(
                  () => TextFormWidget(
                    errorMaxLines: 2,
                    keyboard: TextInputType.number,
                    focusNode: controller.kodeBimbingFocusNode,
                    onChange: controller.getValidationOf.validateKodeBimbing,
                    nextfocusNode: controller.kodeWaliFocusNode,
                    label: 'Kode Bimbing',
                    controller: controller.kodeBimbingController,
                    errorText: controller
                        .getValidationOf.validator.value?.kodeBimbingError,
                  ),
                ),
                Obx(
                  () => TextFormWidget(
                    errorMaxLines: 2,
                    keyboard: TextInputType.number,
                    onChange: controller.getValidationOf.validateKodeWali,
                    focusNode: controller.kodeWaliFocusNode,
                    label: 'Kode Wali',
                    controller: controller.kodeWaliController,
                    errorText: controller
                        .getValidationOf.validator.value?.kodeWaliError,
                  ),
                ),
                Obx(
                  () => TextFormWidget(
                    keyboard: TextInputType.number,
                    label: 'NIP',
                    onChange: controller.getValidationOf.validateNIP,
                    controller: controller.nipController,
                    errorText:
                        controller.getValidationOf.validator.value?.nipError,
                  ),
                ),
                SelectDepartemen(),
                MultiSelectForm(),
                SubmitFormCRUDDosen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
