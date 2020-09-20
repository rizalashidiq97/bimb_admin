import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_list/dosen_list_controller.dart';
import 'package:bimbingan_kuy_admin/global_widget/reusable_app_bar.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_list_item.dart';
import 'dosen_network_states.dart';

class DosenPage extends StatelessWidget {
  final DosenListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: 'Daftar Dosen',
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => controller.navigateToDetailDosen(CRUDMode.create),
          ),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Obx(
        () {
          print('THIS PAGE IS REBUILT');
          final status = controller.networkStates.value;

          if (status == NetworkStates.loading) {
            return LoadingState();
          } else if (status == NetworkStates.failed) {
            return FailedOrNullStates(text: controller.errorNetwork);
          } else {
            if (controller.list.isEmpty) {
              return FailedOrNullStates(
                  text: 'Data dosen saat ini masih kosong');
            }
            return ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (_, index) {
                return ListItemDosen(index: index);
              },
            );
          }
        },
      ),
    );
  }
}
