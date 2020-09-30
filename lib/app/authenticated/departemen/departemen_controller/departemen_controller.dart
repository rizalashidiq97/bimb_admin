import 'dart:io';

import 'package:bimbingan_kuy_admin/app/authenticated/departemen/dialog_form.dart';
import 'package:bimbingan_kuy_admin/global_widget/error_validation_dialog.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_widget/dialog_widget.dart';
import 'package:bimbingan_kuy_admin/service/database/dosen_db.dart';
import 'package:bimbingan_kuy_admin/service/network/departemen_service.dart';
import 'package:bimbingan_kuy_admin/service/network/dosen_service.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:bimbingan_kuy_admin/util/utility/http_exception.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/GetXhelper.dart';
import 'package:get/get.dart';

import '../departemen_model.dart';

class DepartemenController extends GetxController {
  //constructor
  final DepartemenService depService;
  DepartemenController({this.depService});

  //states
  Rx<NetworkStates> networkStates = NetworkStates.loading.obs;
  String errorNetwork = '';
  RxList<Departemen> listDepartemen = List<Departemen>().obs;
  CRUDMode setcrudMode;

  Future<void> initCallDepartemenApi({bool isRefresh = false}) async {
    print('THIS METHOD INVOKED !');

    try {
      final isCallingApi = Get.find<DosenDBService>().isCallingApi();
      if (isCallingApi || isRefresh) {
        if (isRefresh) {
          networkStates.value = NetworkStates.loading;
        }
        final response = await Get.find<DosenService>().getDepartemen();
        Get.find<DosenDBService>().saveDepartementoDB(response);

        listDepartemen.addAll(response);
        networkStates.value = NetworkStates.success;
      } else {
        final dataDepartemen = Get.find<DosenDBService>().getDepartemenfromDB();
        listDepartemen.addAll(dataDepartemen);
        networkStates.value = NetworkStates.success;
      }
    } catch (e) {
      errorNetwork = e.toString();
      networkStates.value = NetworkStates.failed;
    }
  }

  // begin CRUD MODE
  Future<void> crudDepartemen({
    CRUDMode crudMode,
    Departemen departemen,
  }) async {
    try {
      setcrudMode = crudMode;
      final dataDep = await Get.dialog(DialogFormDepartemen(departemen));
      if (dataDep != null && dataDep is Departemen) {
        print('${dataDep.nama} & ${dataDep.id}');
        Get.back();
        Get.dialog(LoadingDialog(useCancelButton: false));
        if (setcrudMode == CRUDMode.create) {
          final response = await depService.createDepartemen(dataDep);
          Get.find<DosenDBService>().addDepartementoDB(response);
          listDepartemen.insert(0, response);
        } else {
          await depService.updateDepartemen(dataDep);
          Get.find<DosenDBService>().updateDepartemenDB(dataDep);
          final index =
              listDepartemen.indexWhere((data) => data.id == dataDep.id);
          listDepartemen[index] = dataDep;
        }
        Get.back();
        Helper.defaultSnackBarSuccess('Departemen berhasil diperbarui !');
      }
    } on FormValidationErrorException<DepartemenErrorModel> catch (e) {
      Get.back();
      Get.dialog(ErrorValidationDialog<DepartemenErrorModel>(message: e.message));
    } catch (e) {
      Get.back();
      Helper.defaultSnackBarError(exitCode);
    }
  }
}
