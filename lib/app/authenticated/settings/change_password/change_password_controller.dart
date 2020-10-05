import 'package:bimbingan_kuy_admin/app/authenticated/settings/change_password/change_password_model.dart';
import 'package:bimbingan_kuy_admin/global_widget/dialog_widget.dart';
import 'package:bimbingan_kuy_admin/global_widget/error_validation_dialog.dart';
import 'package:bimbingan_kuy_admin/service/network/auth_service.dart';
import 'package:bimbingan_kuy_admin/util/utility/http_exception.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/GetXhelper.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  @override
  void onInit() => ever(passwordBaru, onChangePasswordBaru);

  String passwordLama, konfirmasiPassword;
  RxString passwordBaru = ''.obs;
  RxBool validLama = false.obs,
      validBaru = false.obs,
      validKonfirmasi = false.obs;

  bool get isAllowebSubmit =>
      validLama.value == true &&
      validBaru.value == true &&
      validKonfirmasi.value == true;

  RxString _passwordLamaerror = ''.obs;
  String get passwordLamaerror =>
      _passwordLamaerror.value == '' ? null : _passwordLamaerror.value;

  RxString _passwordBaruerror = ''.obs;
  String get passwordBaruerror =>
      _passwordBaruerror.value == '' ? null : _passwordBaruerror.value;

  RxString _kofirmasierror = ''.obs;
  String get konfirmasiError =>
      _kofirmasierror.value == '' ? null : _kofirmasierror.value;

  void setPasswordLama(String val) {
    if (val.isEmpty) {
      _passwordLamaerror.value = 'Password lama tidak boleh kosong';
      validLama.value = false;
    } else {
      _passwordLamaerror.value = '';
      validLama.value = true;
      passwordLama = val;
    }
  }

  void setPasswordBaru(String val) {
    if (val.isEmpty) {
      _passwordBaruerror.value = 'Password baru tidak boleh kosong';
      validBaru.value = false;
    } else {
      if (val.length < 8) {
        _passwordBaruerror.value =
            'Password baru tidak boleh kurang dari 8 karakter';
        validBaru.value = false;
      } else {
        _passwordBaruerror.value = '';
        validBaru.value = true;
      }
    }
    passwordBaru.value = val;
  }

  void setKonfirmasiPassword(String val) {
    if (val.isEmpty) {
      _kofirmasierror.value = 'Konfirmasi password tidak boleh kosong';
      validKonfirmasi.value = false;
    } else if (val != passwordBaru.value) {
      _kofirmasierror.value = 'Konfirmasi password tidak sama';
      validKonfirmasi.value = false;
    } else {
      _kofirmasierror.value = '';
      validKonfirmasi.value = true;
    }
    konfirmasiPassword = val;
  }

  Future<void> submit() async {
    try {
      Get.dialog(LoadingDialog(useCancelButton: false));
      await Get.find<AuthService>().changePasswordService(
          passwordLama, passwordBaru.value, konfirmasiPassword);
      Get.back();
      Helper.defaultSnackBarSuccess('Password anda tekah diubah !');
    } on FormValidationErrorException<PasswordErrorModel> catch (e) {
      Get.back();
      Get.dialog(ErrorValidationDialog<PasswordErrorModel>(message: e.message));
    } catch (e) {
      Get.back();
      Helper.defaultSnackBarError(e);
    }
  }

  onChangePasswordBaru(String val) {
    if (konfirmasiPassword != null && val != konfirmasiPassword) {
      print('ENTER THIS');
      _kofirmasierror.value = 'Konfirmasi password tidak sama';
      validKonfirmasi.value = false;
    } else if (konfirmasiPassword != null && !validKonfirmasi.value) {
      _kofirmasierror.value = '';
      validKonfirmasi.value = true;
    }
  }
}
