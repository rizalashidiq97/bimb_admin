import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatelessWidget {
  final void Function() cancelCallback;
  final void Function() okCallback;
  final bool useOkButton;
  final bool useCancelButton;

  const LoadingDialog({
    Key key,
    this.cancelCallback,
    this.okCallback,
    this.useOkButton = false,
    this.useCancelButton = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('Mohon Tunggu...'),
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: ScreenUtil().setWidth(50)),
            Text(
              'Sedang proses...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenUtil().setSp(25),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          useOkButton
              ? FlatButton(
                  child: Text('OK'),
                  onPressed: () => okCallback(),
                )
              : Container(),
          useCancelButton
              ? FlatButton(
                  child: Text('Batal'),
                  onPressed: () => cancelCallback(),
                )
              : Container(),
        ],
      ),
    );
  }
}
