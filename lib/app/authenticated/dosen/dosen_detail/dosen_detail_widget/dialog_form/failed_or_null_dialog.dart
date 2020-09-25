import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/select_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FailedOrNullDialog extends StatelessWidget {
  final String error;

  const FailedOrNullDialog({
    Key key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectFormController controller = Get.find();
    return AlertDialog(
      title: Text('Error'),
      content: Text(error),
      actions: <Widget>[
        FlatButton(
          child: Text('Segarkan'),
          onPressed: () => controller.initCallDepartemenApi(isRefresh: true),
        ),
      ],
    );
  }
}
