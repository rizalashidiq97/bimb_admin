import 'package:bimbingan_kuy_admin/service/auth_service.dart';
import 'package:bimbingan_kuy_admin/service/http_client.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:get/get.dart';

import 'global_controller/controller/auth_controller.dart';

class MainAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpClient(), tag: StringUtil.dioWithAuth);
    Get.lazyPut(
      () => HttpClient(withAuth: false),
      tag: StringUtil.dioWithoutAuth,
    );
    Get.lazyPut(
      () => AuthService(
        dio: Get.find<HttpClient>(tag: StringUtil.dioWithAuth).dio,
        diowithoutAuth:
            Get.find<HttpClient>(tag: StringUtil.dioWithoutAuth).dio,
      ),
    );
    Get.put<AuthController>(
      AuthController(authService: Get.find<AuthService>()),
    );
  }
}
