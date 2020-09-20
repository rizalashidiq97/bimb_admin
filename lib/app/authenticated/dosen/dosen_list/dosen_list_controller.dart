import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/navigator_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/User.dart';
import 'package:bimbingan_kuy_admin/service/dosen_service.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/GetXhelper.dart';
import 'package:get/get.dart';

class DosenListController extends GetxController {
  final DosenService dosenService;
  DosenListController({this.dosenService});

  Rx<NetworkStates> networkStates = NetworkStates.loading.obs;
  String errorNetwork = '';
  RxList<User> list = List<User>().obs;

  @override
  void onReady() => initCallApi();

  String roles(int index) {
    return list[index]
        .roles
        .map((data) => data.name)
        .toList()
        .join(', ')
        .replaceAll(RegExp('[\\_]+'), ' ');
  }

  Future<void> initCallApi({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        networkStates.value = NetworkStates.loading;
      }

      final response = await dosenService.getDataDosen();
      final initList = <User>[];
      for (User data in response.users) {
        if (data.dosen != null) {
          initList.add(data);
        }
      }
      list.addAll(initList);
      networkStates.value = NetworkStates.success;
    } catch (e) {
      errorNetwork = e.toString();
      networkStates.value = NetworkStates.failed;
      Helper.defaultSnackBarError(e);
    }
  }

  void navigateToDetailDosen(CRUDMode crudMode, {User user}) {
    Get.toNamed(
      NameRoutes.dosenDetail,
      id: 1,
      arguments: PassDataFromDosenListtoDosenDetail(
        crudMode: crudMode,
        user: user,
      ),
    );
  }
}
