import 'package:flutter/material.dart' show Color, Colors;
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  Color changeColorToggleActive(int id) {
    return selectedIndex.value == id ? Get.theme.accentColor : Colors.grey;
  }

  void updateIndexTab(int value) {
    selectedIndex.value = value;
  }
}
