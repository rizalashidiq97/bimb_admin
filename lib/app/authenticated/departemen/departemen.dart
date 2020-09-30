import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_controller/departemen_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_list/dosen_network_states.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_widget/reusable_app_bar.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DepartemenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DepartemenController controller = Get.find();
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: 'Departemen',
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              controller.crudDepartemen(
                  crudMode: CRUDMode.create, departemen: Departemen());
            },
          ),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Obx(
        () {
          print('THIS Departemen IS REBUILT');
          final status = controller.networkStates.value;
          if (status == NetworkStates.loading) {
            return LoadingState();
          } else if (status == NetworkStates.failed) {
            return FailedOrNullStates(text: controller.errorNetwork);
          } else {
            if (controller.listDepartemen.isEmpty) {
              return FailedOrNullStates(
                  text: 'Data departemen saat ini masih kosong');
            }
            return ListView.builder(
              itemCount: controller.listDepartemen.length,
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      controller.crudDepartemen(
                        crudMode: CRUDMode.update,
                        departemen: Departemen(
                          id: controller.listDepartemen[index].id,
                          nama: controller.listDepartemen[index].nama,
                        ),
                      );
                    },
                    title: Text(
                      controller.listDepartemen[index].nama,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(32),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: Icon(Icons.account_balance, color: Colors.purple),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
