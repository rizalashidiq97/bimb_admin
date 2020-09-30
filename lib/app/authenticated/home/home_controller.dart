import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_controller/departemen_controller.dart';
import 'package:flutter/material.dart' show Color, Colors;
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  bool _isInstantiatedDepartemenPage = false;

  Color changeColorToggleActive(int id) {
    return selectedIndex.value == id ? Get.theme.accentColor : Colors.grey;
  }

  void updateIndexTab(int value) {
    selectedIndex.value = value;
    switch (selectedIndex.value) {
      case 1:
        if (!_isInstantiatedDepartemenPage) {
          _isInstantiatedDepartemenPage = true;
          Get.find<DepartemenController>().initCallDepartemenApi();
        }
        break;
      default:
        break;
    }
  }

  Future<bool> handleBackPress() async {
    final isFirstRouteInCurrentTab =
        !await Get.nestedKey(selectedIndex.value + 1).currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (selectedIndex.value != 0) {
        updateIndexTab(0);
        return false;
      }
    }

    return isFirstRouteInCurrentTab;
  }
}
