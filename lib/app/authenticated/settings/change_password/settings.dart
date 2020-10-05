import 'package:bimbingan_kuy_admin/global_controller/global/auth_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/reusable_app_bar.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: 'Pengaturan',
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Anda masuk sebagai : '),
            Text(
              'Administrator ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              thickness: 2.0,
            ),
            InkWell(
              onTap: () => Get.toNamed(NameRoutes.changepass),
              child: ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('Ubah Password'),
              ),
            ),
            InkWell(
              onTap: () => Get.find<AuthController>().logout(),
              child: ListTile(
                leading: Icon(Icons.exit_to_app,color: Colors.red,),
                title: Text('Logout',style: TextStyle(color: Colors.red),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
