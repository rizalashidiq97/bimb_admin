import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/reusable_app_bar.dart';
import 'package:bimbingan_kuy_admin/global_widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dosen_detail_widget/select_roles.dart';
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
                GetX<DosenDetailController>(
                  builder: (_) {
                    print(
                        'nama error : ${DosenDetailController.getValidationOf.errorNama}');
                    return TextFormWidget(
                      nextfocusNode: controller.emailFocusNode,
                      label: 'Nama',
                      controller: controller.namaController,
                      onChange: (val) => DosenDetailController.getValidationOf
                          .validateName(val),
                      errorText:
                          DosenDetailController.getValidationOf.errorNama,
                    );
                  },
                ),
                Obx(
                  () {
                    print(
                        'email error : ${DosenDetailController.getValidationOf.errorEmail}');
                    return TextFormWidget(
                      errorMaxLines: 2,
                      warning: DosenDetailController
                          .getValidationOf.emailWarning.value,
                      keyboard: TextInputType.emailAddress,
                      focusNode: controller.emailFocusNode,
                      nextfocusNode: controller.kodeBimbingFocusNode,
                      label: 'Email',
                      controller: controller.emailController,
                      onChange:
                          DosenDetailController.getValidationOf.validateEmail,
                      errorText:
                          DosenDetailController.getValidationOf.errorEmail,
                    );
                  },
                ),
                Obx(
                  () {
                    print(
                        'kodebimbing error : ${DosenDetailController.getValidationOf.errorKodeBimbing}');
                    return TextFormWidget(
                      errorMaxLines: 2,
                      keyboard: TextInputType.number,
                      focusNode: controller.kodeBimbingFocusNode,
                      onChange: DosenDetailController
                          .getValidationOf.validateKodeBimbing,
                      nextfocusNode: controller.kodeWaliFocusNode,
                      label: 'Kode Bimbing',
                      controller: controller.kodeBimbingController,
                      errorText: DosenDetailController
                          .getValidationOf.errorKodeBimbing,
                    );
                  },
                ),
                Obx(
                  () {
                    print(
                        'kodwali error : ${DosenDetailController.getValidationOf.errorkodeWali}');
                    return TextFormWidget(
                      errorMaxLines: 2,
                      keyboard: TextInputType.number,
                      onChange: DosenDetailController
                          .getValidationOf.validateKodeWali,
                      focusNode: controller.kodeWaliFocusNode,
                      label: 'Kode Wali',
                      controller: controller.kodeWaliController,
                      errorText:
                          DosenDetailController.getValidationOf.errorkodeWali,
                    );
                  },
                ),
                Obx(
                  () {
                    print(
                        'nipError error : ${DosenDetailController.getValidationOf.errorkodeNIP}');
                    return TextFormWidget(
                      keyboard: TextInputType.number,
                      label: 'NIP',
                      onChange:
                          DosenDetailController.getValidationOf.validateNIP,
                      controller: controller.nipController,
                      errorText:
                          DosenDetailController.getValidationOf.errorkodeNIP,
                    );
                  },
                ),
                SelectDepartemen(),
                SelectRoles(),
                SubmitFormCRUDDosen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
