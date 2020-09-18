import 'package:bimbingan_kuy_admin/global_controller/controller/auth_controller.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  final getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${authController.authData.value.email}'),
            Text('${authController.authData.value.id}'),
            Text('${authController.authData.value.name}'),
            Text('${authController.token}'),
            Text('--- Check GetStorage'),
            Text('${getStorage.read(StringUtil.accessToken)}'),
            Text('${getStorage.read(StringUtil.authData)}'),
            RaisedButton(
              onPressed: () => authController.logout(),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
