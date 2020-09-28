import 'package:bimbingan_kuy_admin/global_model/formDosen_errorModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormValidationDialog extends StatelessWidget {
  const FormValidationDialog({this.message});
  final FormDosenErrorModel message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error', style: Get.textTheme.headline6),
      titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      contentPadding: EdgeInsets.fromLTRB(24.0,12.0, 24.0, 0.0),
      content: SingleChildScrollView(
        child: Column(
          children: listErrorWidget(),
        ),
      ),
      actions: [FlatButton(child: Text('Ok'), onPressed: () => Get.back())],
    );
  }

  List<Widget> listErrorWidget() {
    List<Widget> _listError = [];
    TextStyle _textStyle = TextStyle(fontSize: 15);

    for (String kodeBimbing in message.kodeBimbing) {
      _listError.add(Text('- $kodeBimbing', style: _textStyle));
    }

    for (String kodeWali in message.kodeWali) {
      _listError.add(Text('- $kodeWali', style: _textStyle));
    }

    for (String nip in message.nip) {
      _listError.add(Text('- $nip', style: _textStyle));
    }

    return _listError;
  }
}
