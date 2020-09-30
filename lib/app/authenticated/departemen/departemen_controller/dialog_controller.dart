import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_controller/departemen_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' show TextEditingController;
import '../../../../util/extension/string_extension.dart';

class DialogDepartemenController extends GetxController {
  final Departemen departemen;
  DialogDepartemenController(this.departemen);

  TextEditingController textController;
  //CRUD
  String errorText;
  bool isValidText = false;
  Departemen departemenData;
  CRUDMode crudMode;

  @override
  void onInit() {
    departemenData = departemen;
    crudMode = Get.find<DepartemenController>().setcrudMode;
    textController = TextEditingController(
        text: crudMode == CRUDMode.update ? departemen?.nama : '');
  }

  String get textButton => crudMode == CRUDMode.update ? 'Ubah' : 'Tambah';
  bool get isAllowedSubmit => isValidText == true;

  void setValidaton(String value) {
    String preverrorText = errorText;
    if (value.isEmpty) {
      isValidText = false;
      errorText = 'Departemen'.isRequired;
      update(['updateText'], errorText != preverrorText);
    } else {
      isValidText = true;
      errorText = null;
      update(['updateText'], errorText != preverrorText);
      departemenData = departemen.copyWith(nama: value);
    }
    update(['submit']);
  }

  void dispose() {
    textController.dispose();
  }
}
