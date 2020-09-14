import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/utitity/string_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() => fetchToken();

  Future<void> fetchToken() async {
    final hasToken = GetStorage().hasData(StringUtil.accessToken);
    await Future.delayed(Duration(seconds: 2));
    if (hasToken) {
      Get.offNamed(NameRoutes.home);
    } else {
      Get.offNamed(NameRoutes.login);
    }
  }
}
