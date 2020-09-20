import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  final int idNavigator;

  const NotFoundPage({Key key, this.idNavigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Kembali ke halaman utama'),
            RaisedButton(
              child: Text(
                'Kembali',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                idNavigator != null ? Get.back(id: idNavigator) : Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
