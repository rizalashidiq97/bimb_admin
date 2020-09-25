import 'dart:convert';

import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:get_storage/get_storage.dart';

class AuthDB {
  final storage = GetStorage();

  Map<String, dynamic> getAuthData() {
    final hasToken = storage.hasData(StringUtil.accessToken);
    if (hasToken) {
      return {
        "userData": json.decode(storage.read<String>(StringUtil.authData))
            as Map<String, dynamic>,
        "accessToken": storage.read<String>(StringUtil.accessToken)
      };
    }
    return {};
  }

  void saveAuthData(NetworkAuthModel authModel) =>
      storage.write(StringUtil.authData, json.encode(authModel.toMap()));

  void saveAccessToken(String accessToken) =>
      storage.write(StringUtil.accessToken, accessToken);
}
