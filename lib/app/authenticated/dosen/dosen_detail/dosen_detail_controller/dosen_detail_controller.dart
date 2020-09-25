import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_validation_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_list/dosen_list_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/navigator_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Role.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/User.dart';
import 'package:bimbingan_kuy_admin/global_model/dosenModel/Dosen.dart';
import 'package:bimbingan_kuy_admin/global_widget/dialog_widget.dart';
import 'package:bimbingan_kuy_admin/service/network/dosen_service.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/GetXhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosenDetailController extends GetxController {
  final PassDataFromDosenListtoDosenDetail data;
  final DosenService dosenService;
  DosenDetailController({this.data, this.dosenService});

  //text controller
  final emailController = TextEditingController();
  final kodeBimbingController = TextEditingController();
  final kodeWaliController = TextEditingController();
  final nipController = TextEditingController();
  final namaController = TextEditingController();
  final departemenController = TextEditingController();

  //focus node
  final kodeBimbingFocusNode = FocusNode();
  final kodeWaliFocusNode = FocusNode();
  final namaFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  //state
  Rx<User> detailDosen = User().obs;

  //getter
  DosenValidationController get getValidationOf =>
      Get.find<DosenValidationController>();
  String get appBarTitle => data.crudMode == CRUDMode.update
      ? 'Edit Data Dosen'
      : 'Tambah Data Dosen';

  @override
  void onInit() {
    if (data.crudMode == CRUDMode.update) {
      detailDosen(data.user);
      emailController.text = data.user.email;
      kodeBimbingController.text = data.user.dosen.kodeBimbing.toString();
      kodeWaliController.text = data.user.dosen.kodeWali.toString();
      nipController.text = data.user.dosen.nip;
      namaController.text = data.user.dosen.nama;
      departemenController.text = data.user.departemen.nama;
    } else {
      detailDosen(
        User(
          id: null,
          email: null,
          departemen: Departemen(),
          dosen: Dosen(),
          name: null,
          roles: [],
        ),
      );
    }
  }

  void setName(String value) {
    detailDosen(detailDosen.value
        .copyWith(dosen: detailDosen.value.dosen.copyWith(nama: value)));
    print(detailDosen.value.toString());
  }

  void setEmail(String value) {
    detailDosen(detailDosen.value.copyWith(email: value));
    print(detailDosen.value.toString());
  }

  void setKodeBimbing(String value) {
    detailDosen(detailDosen.value.copyWith(
        dosen:
            detailDosen.value.dosen.copyWith(kodeBimbing: int.parse(value))));
    print(detailDosen.value.toString());
  }

  void setKodeWali(String value) {
    detailDosen(detailDosen.value.copyWith(
        dosen: detailDosen.value.dosen.copyWith(kodeWali: int.parse(value))));
    print(detailDosen.value.toString());
  }

  void setNIP(String value) {
    detailDosen(detailDosen.value
        .copyWith(dosen: detailDosen.value.dosen.copyWith(nip: value)));
    print(detailDosen.value.toString());
  }

  void setDepartemen(Departemen data) {
    detailDosen(detailDosen.value.copyWith(departemen: data));
    departemenController.text = detailDosen.value.departemen?.nama;
    print(detailDosen.value.toString());
  }

  void setRole(List<Role> value) {
    detailDosen(detailDosen.value.copyWith(roles: value));
    print(detailDosen.value.toString());
  }

  void deleteRole(Role deletedRole) {
    final replaceRoles = detailDosen.value.roles;
    replaceRoles.removeWhere((data) => data.name == deletedRole.name);
    detailDosen(detailDosen.value.copyWith(roles: replaceRoles));
    if (detailDosen.value.roles.isEmpty) {
      getValidationOf.validateRoles(null);
    }
    print(detailDosen.value.toString());
  }

  Future<void> submitForm() async {
    print(detailDosen.value.toString());
    // String response;
    // try {
    //   Get.dialog(LoadingDialog(
    //     useCancelButton: false,
    //   ));
    //   if (data.crudMode == CRUDMode.create) {
    //     response = await dosenService.createDosen();
    //     if (response == 'ok') {
    //       Get.find<DosenListController>().addDosen(detailDosen.value);
    //       Get.back();
    //       Get.back();
    //       Helper.defaultSnackBarSuccess('Data berhasil ditambahkan !');
    //     }
    //   } else {
    //     response = await dosenService.updateDosen();
    //     if (response == 'ok') {
    //       Get.find<DosenListController>().updateDosen(detailDosen.value);
    //       Get.back();
    //       Helper.defaultSnackBarSuccess('Data berhasil diperbarui !');
    //     }
    //   }
    // } catch (e) {
    //   Get.back();
    //   Helper.defaultSnackBarError(e);
    // }
  }

  void dispose() {
    emailController.dispose();
    kodeBimbingController.dispose();
    kodeWaliController.dispose();
    nipController.dispose();
    namaController.dispose();
    departemenController.dispose();
    kodeBimbingFocusNode.dispose();
    kodeWaliFocusNode.dispose();
    namaFocusNode.dispose();
    emailFocusNode.dispose();
  }
}
