import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/navigator_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/User.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:get/get.dart';

class DosenDetailController extends GetxController {
  final PassDataFromDosenListtoDosenDetail data;
  DosenDetailController({this.data});

  Rx<User> detailDosen = User().obs;

  @override
  void onInit() {
    if (data.crudMode == CRUDMode.update) {
      detailDosen(data.user);
    }
  }
}
