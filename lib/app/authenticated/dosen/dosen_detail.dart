import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_model/navigator_model.dart';

class DosenDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PassDataFromDosenListtoDosenDetail argumentsData = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen Detail'),
      ),
      body: Center(
        child: Text('Dosen with id ${argumentsData.idDosen}'),
      ),
    );
  }
}
