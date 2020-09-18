import 'package:flutter/material.dart';

class DepartemenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Departemen Page'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('This is index departemen $index'),
          );
        },
      ),
    );
  }
}
