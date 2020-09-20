import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dummy2_controller.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(
            'Go',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Get.toNamed(NameRoutes.dummy2),
        ),
      ),
    );
  }
}

class DummyPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dummy2Controller controller = Get.find();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(
            'Go',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Get.toNamed(NameRoutes.home),
        ),
      ),
    );
  }
}
