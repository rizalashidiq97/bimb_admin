import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_model/navigator_model.dart';

class DosenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen Page'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () => Get.toNamed(
              NameRoutes.dosenDetail,
              id: 1,
              arguments: PassDataFromDosenListtoDosenDetail(index),
            ),
            title: Text('This is index dosen $index'),
          );
        },
      ),
    );
  }
}
