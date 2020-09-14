import 'package:bimbingan_kuy_admin/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'main_app_binding.dart';
import 'util/theme/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainAppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'SIBIMBING - Admin',
      theme: DataThemes.theme,
      getPages: Routes.ofPages,
    );
  }
}
