import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_validation_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_widget/dialog_form/selectForm_dialog.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class SelectRoles extends StatelessWidget {
  const SelectRoles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DosenDetailController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => showDialogDepartemen(),
        child: Obx(
          () {
            final errorText = DosenDetailController.getValidationOf.errorROles;
            print('role error : $errorText');
            return InputDecorator(
              isEmpty: controller.listRole.isEmpty,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                fillColor: Colors.white,
                errorText: errorText,
                labelText: 'Hak Akses',
                labelStyle: TextStyle(
                  color:
                      errorText != null ? Colors.red : Get.theme.primaryColor,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff838383)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () {
                      return Wrap(
                        spacing: 8.0,
                        runSpacing: 0.0,
                        children: controller.listRole
                            .map(
                              (data) => Chip(
                                deleteIconColor: Colors.white,
                                deleteIcon: Icon(
                                  Icons.close,
                                  size: 15,
                                ),
                                onDeleted: () => controller.deleteRole(data),
                                backgroundColor: Get.theme.accentColor,
                                label: Text(
                                  data.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(22),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showDialogDepartemen() {
    Get.dialog(SelectFormDialog(formFor: FormFor.role)).then((value) {
      Get.find<DosenValidationController>().validateRoles(value);
    });
  }
}
