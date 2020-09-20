import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosenDetail extends StatelessWidget {
  final DosenDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen Detail'),
      ),
      body: Center(
        child: Text('Dosen with id ${controller.data}'),
      ),
    );
  }
}
