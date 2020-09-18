import 'package:flutter/material.dart';

class DosenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen Page'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('This is index dosen $index'),
          );
        },
      ),
    );
  }
}
