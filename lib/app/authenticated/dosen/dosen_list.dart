import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_list_controller.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dosen_model/navigator_model.dart';

class DosenPage extends StatelessWidget {
  final DosenListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Dosen',
          style: TextStyle(fontSize: ScreenUtil().setSp(40)),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: GetBuilder(
        builder: (_) {
          print('GetBuilder rebuilt');
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (_, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () => Get.toNamed(
                    NameRoutes.dosenDetail,
                    id: 1,
                    arguments: PassDataFromDosenListtoDosenDetail(index),
                  ),
                  title: Text(
                    'Dosen $index',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Departemen Informatika',
                    style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
