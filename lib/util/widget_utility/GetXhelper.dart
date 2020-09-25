import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static void defaultSnackBarError(e) {
    Get.snackbar(
      'Error',
      e.toString(),
      maxWidth: Get.width,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      icon: Icon(
        Icons.cancel,
        color: Colors.red,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  static void defaultSnackBarSuccess(String message) {
    Get.snackbar(
      'Sukses',
      message,
      maxWidth: Get.width,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      icon: Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }
}
