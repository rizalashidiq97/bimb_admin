import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  void unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
