import 'package:bimbingan_kuy_admin/app/authenticated/home/home.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/home_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/settings/change_password/change_password.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/settings/change_password/change_password_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/settings/change_password/settings.dart';
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
      binding:
          BindingsBuilder(() => Get.put<LoginController>(LoginController())),
    ),
    GetPage(
      name: NameRoutes.home,
      page: () => HomePage(),
      binding: BindingsBuilder(() => Get.put<HomeController>(HomeController())),
    ),
    GetPage(
      name: NameRoutes.setting,
      page: () => Settings(),
    ),
    GetPage(
      name: NameRoutes.changepass,
      page: () => ChangePassword(),
      binding: BindingsBuilder(
          () => Get.put<ChangePasswordController>(ChangePasswordController())),
    )
  ];
}
