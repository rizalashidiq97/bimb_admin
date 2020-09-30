import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_model.dart';
import 'package:bimbingan_kuy_admin/global_model/formDosen_errorModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorValidationDialog<T> extends StatelessWidget {
  const ErrorValidationDialog({this.message});
  final T message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error', style: Get.textTheme.headline6),
      titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      contentPadding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listErrorWidget(),
        ),
      ),
      actions: [FlatButton(child: Text('Ok'), onPressed: () => Get.back())],
    );
  }

  List<Widget> listErrorWidget() {
    List<Widget> _listError = [];
    TextStyle _textStyle = TextStyle(fontSize: 15);
    var messageData = this.message;

    if (messageData is FormDosenErrorModel) {
      for (String kodeBimbing in messageData?.kodeBimbing) {
        _listError.add(Text('- $kodeBimbing', style: _textStyle));
      }

      for (String kodeWali in messageData?.kodeWali) {
        _listError.add(Text('- $kodeWali', style: _textStyle));
      }

      for (String nip in messageData?.nip) {
        _listError.add(Text('- $nip', style: _textStyle));
      }
    } else if (messageData is DepartemenErrorModel) {
      for (String nama in messageData?.nama) {
        _listError.add(Text('- $nama', style: _textStyle));
      }
    } else {
      _listError.add(Text('- Tidak ada error', style: _textStyle));
    }

    return _listError;
  }
}
