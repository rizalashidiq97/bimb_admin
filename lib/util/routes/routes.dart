import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_list_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/dummy.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/dummy2_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/home.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/home_controller.dart';
import 'package:bimbingan_kuy_admin/app/unauthenticated/login/login_controller.dart';
import 'package:get/get.dart';
import 'name_routes.dart';

import '../../app/unauthenticated/splash_screen/splash_screen.dart';
import '../../app/unauthenticated/splash_screen/splash_screen_controller.dart';
import '../../app/unauthenticated/login/login.dart';

class Routes {
  static final ofPages = [
    GetPage(
      name: NameRoutes.splash,
      page: () => SplashScreen(),
      binding: BindingsBuilder(
        () => Get.put<SplashScreenController>(SplashScreenController()),
      ),
    ),
    GetPage(
      name: NameRoutes.login,
      page: () => LoginPage(),
      binding: BindingsBuilder(
        () => Get.put<LoginController>(LoginController()),
      ),
    ),
    GetPage(
      name: NameRoutes.dummy,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => Dummy2Controller(), fenix: true);
      }),
      page: () => DummyPage(),
    ),
    GetPage(
      name: NameRoutes.dummy2,
      page: () => DummyPage2(),
    ),
    GetPage(
      name: NameRoutes.home,
      page: () => HomePage(),
      binding: BindingsBuilder(
        () {
          Get.put<HomeController>(HomeController());
          Get.put(DosenListController());
          // Get.lazyPut(() => DosenDetailController());
        },
      ),
    )
  ];
}
