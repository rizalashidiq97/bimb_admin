import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_list_controller.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class FailedOrNullStates extends StatelessWidget {
  final String text;
  const FailedOrNullStates({
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DosenListController controller = Get.find();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          Container(
            child: RaisedButton.icon(
              onPressed: () => controller.initCallApi(isRefresh: true),
              icon: Icon(Icons.refresh, color: Colors.white),
              label: Text(
                'Segarkan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
