import 'package:bimbingan_kuy_admin/global_model/auth_model.dart';
import 'package:bimbingan_kuy_admin/service/database/auth_db.dart';
import 'package:bimbingan_kuy_admin/service/network/auth_service.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthService authService;
  final AuthDB authDb;
  AuthController({this.authDb, this.authService});

  RxString _token = ''.obs;
  Rx<AuthData> authData = AuthData().obs;

  String get token => _token.value == '' ? null : _token.value;

  @override
  void onInit() => setDataFromDisk();

  setDataFromDisk() {
    final userData = authDb.getAuthData();
    if (userData.isNotEmpty) {
      _token.value = userData["accessToken"];

      authData.value = AuthData(
          email: userData["userData"]['email'],
          name: userData["userData"]['name'],
          id: userData["userData"]['userId']);
    }
  }

  writeDatatoDisk({bool isRefreshToken, NetworkAuthModel authModel}) {
    print('>>  WRITE DATA TO DISK');
    authDb.saveAccessToken(authModel.accessToken);
    _token.value = authModel.accessToken ?? _token.value;

    if (authModel != null && isRefreshToken == null) {
      authDb.saveAuthData(authModel);
      authData.value = AuthData(
        name: authModel.user.name,
        email: authModel.user.email,
        id: authModel.user.id,
      );
    }
  }

  Future<bool> login() async {
    try {
      final response = await authService.loginService();

      int roleIndex =
          response.user.roles.indexWhere((data) => data.name == 'Admin');
      print(roleIndex);
      if (roleIndex != -1) {
        writeDatatoDisk(authModel: response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    print('>>  LOGOUT');
    GetStorage().erase();
    _token.value = null;
    authData.value = AuthData();
    Get.offAllNamed(NameRoutes.login);
  }
}
