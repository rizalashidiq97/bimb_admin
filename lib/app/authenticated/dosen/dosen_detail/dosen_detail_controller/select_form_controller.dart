import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Role.dart';
import 'package:bimbingan_kuy_admin/service/database/dosen_db.dart';
import 'package:bimbingan_kuy_admin/service/network/dosen_service.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:get/get.dart';

class SelectFormController extends GetxController {
  //constructor
  final FormFor formFor;
  SelectFormController({this.formFor});

  //state
  Rx<NetworkStates> networkStates = NetworkStates.loading.obs;
  String errorNetwork = 'Tidak ada error';
  RxList<Departemen> listDepartemen = List<Departemen>().obs;
  RxList<Role> listRoles = List<Role>().obs;

  @override
  void onReady() {
    if (formFor == FormFor.departemen) {
      initCallDepartemenApi();
    } else {
      initRoles();
    }
  }

  // // BLOC for departemen form
  Future<void> initCallDepartemenApi({bool isRefresh = false}) async {
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

  bool isCheckedDepartemen(int choosedid) {
    final user = Get.find<DosenDetailController>().detailDosen.value;
    return choosedid == user.departemen?.id;
  }
  // // end of BLOC for departemen form

  // // BLOC for roles form
  void initRoles() {
    listRoles.addAll([
      Role(id: 3, name: 'Dosen', checked: isCheckedRoles(3)),
      Role(id: 4, name: 'Koordinator skripsi', checked: isCheckedRoles(4)),
      Role(id: 5, name: 'Koordinator pkl', checked: isCheckedRoles(5)),
    ]);

    networkStates.value = NetworkStates.success;
  }

  bool isCheckedRoles(int id) {
    final roles = Get.find<DosenDetailController>().detailDosen.value.roles;
    final index = roles.indexWhere((data) => data.id == id);
    return index != -1 ? true : false;
  }

  void onChangeRoles(Role role, bool val) {
    final index = listRoles.indexWhere((data) => data.id == role.id);
    listRoles[index] = Role(id: role.id, name: role.name, checked: val);
  }

  void goBackFromRoles({bool cancel = false}) {
    if (cancel) {
      final user = Get.find<DosenDetailController>().detailDosen.value;
      Get.back(result: user.roles.isNotEmpty ? user.roles : null);
    } else {
      final assignListRole = listRoles.where((data) => data.checked).toList();
      if (assignListRole.isNotEmpty) {
        Get.back(result: assignListRole);
      }
    }
  }
  // // end of BLOC for roles form

  // on back pressed android & IOS
  Future<bool> goBackFromDepartemenOnWillPop() async {
    final user = Get.find<DosenDetailController>().detailDosen.value;
    Get.back(result: user.departemen.id == null ? null : user.departemen);
    return true;
  }

  Future<bool> goBackFromRolesOnWillPop() async {
    final user = Get.find<DosenDetailController>().detailDosen.value;
    Get.back(result: user.roles.isNotEmpty ? user.roles : null);
    return true;
  }
  //

}
