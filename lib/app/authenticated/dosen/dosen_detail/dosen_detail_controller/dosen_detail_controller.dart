import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_validation_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/error_validation_dialog.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_list/dosen_list_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/navigator_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Role.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/User.dart';
import 'package:bimbingan_kuy_admin/global_model/dosenModel/Dosen.dart';
import 'package:bimbingan_kuy_admin/global_model/formDosen_errorModel.dart';
import 'package:bimbingan_kuy_admin/global_widget/dialog_widget.dart';
import 'package:bimbingan_kuy_admin/service/network/dosen_service.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:bimbingan_kuy_admin/util/utility/http_exception.dart';
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
  User detailDosen = User();
  RxList<Role> listRole = List<Role>().obs;

  //getter
  static DosenValidationController get getValidationOf => Get.find();
  String get appBarTitle => data.crudMode == CRUDMode.update
      ? 'Edit Data Dosen'
      : 'Tambah Data Dosen';

  @override
  void onInit() {
    if (data.crudMode == CRUDMode.update) {
      detailDosen = data.user;
      listRole.addAll(data.user.roles);
      setTextEditingController(data.user);
    } else {
      detailDosen = User(
        id: null,
        email: null,
        departemen: Departemen(),
        dosen: Dosen(),
        name: null,
        roles: [],
      );
    }
    print(detailDosen.toString());
  }

  void setTextEditingController(User userData) {
    emailController.text = userData.email;
    kodeBimbingController.text = userData.dosen.kodeBimbing.toString();
    kodeWaliController.text = userData.dosen.kodeWali.toString();
    nipController.text = userData.dosen.nip;
    namaController.text = userData.dosen.nama;
    departemenController.text = userData.departemen.nama;
  }

  void setName(String value) => detailDosen = detailDosen.setName(value);
  void setEmail(String value) => detailDosen = detailDosen.setEmail(value);
  void setKodeBimbing(String value) =>
      detailDosen = detailDosen.setKodeBimbing(value);
  void setKodeWali(String value) =>
      detailDosen = detailDosen.setKodeWali(value);
  void setNIP(String value) => detailDosen = detailDosen.setNIP(value);

  void setDepartemen(Departemen data) {
    detailDosen = detailDosen.copyWith(departemen: data);
    departemenController.text = data?.nama;
  }

  void setRole(List<Role> value) {
    detailDosen = detailDosen.copyWith(roles: value);
    if (value != null && value.isNotEmpty) {
      listRole.replaceRange(0, listRole.length, value);
    }
  }

  void deleteRole(Role deletedRole) {
    final listafterRemoved = detailDosen.roles
      ..removeWhere((data) => data.id == deletedRole.id);

    detailDosen = detailDosen.copyWith(roles: listafterRemoved);
    listRole.removeWhere((data) => data.id == deletedRole.id);
    if (detailDosen.roles.isEmpty) {
      getValidationOf.validateRoles(null);
    }
  }

  Future<void> submitForm() async {
    print(detailDosen.toString());
    try {
      Get.dialog(LoadingDialog(useCancelButton: false));
      if (data.crudMode == CRUDMode.create) {
        final responseCreated = await dosenService.createDosen();
        Get.find<DosenListController>().addDosen(responseCreated);
        Get.back();
        Get.back(id: 1);
        Helper.defaultSnackBarSuccess('Data berhasil ditambahkan !');
      } else {
        final responseUpdated = await dosenService.updateDosen();
        if (responseUpdated) {
          Get.find<DosenListController>().updateDosen(detailDosen);
          getValidationOf.setPrevEmail = detailDosen.email;
          Get.back();
          Helper.defaultSnackBarSuccess('Data berhasil diperbarui !');
        }
      }
    } on FormValidationErrorException<FormDosenErrorModel> catch (e) {
      Get.back();
      Get.dialog(ErrorValidationDialog<FormDosenErrorModel>(message: e.message));
    } catch (e) {
      Get.back();
      Helper.defaultSnackBarError(e);
    }
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
