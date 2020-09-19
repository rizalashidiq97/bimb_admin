import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() => checkToken();

  Future<void> checkToken() async {
    final hasToken = GetStorage().hasData(StringUtil.accessToken);
    await Future.delayed(Duration(seconds: 2));
    if (hasToken) {
      Get.offNamed(NameRoutes.dummy);
    } else {
      Get.offNamed(NameRoutes.login);
    }
  }
}
