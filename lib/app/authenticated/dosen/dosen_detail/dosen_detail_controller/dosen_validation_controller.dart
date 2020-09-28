import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/navigator_model.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/validation_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Role.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import '../../../../../util/extension/string_extension.dart';
import 'package:get/get.dart';

class DosenValidationController extends GetxController {
  final PassDataFromDosenListtoDosenDetail data;
  DosenValidationController({this.data});

  Rx<DosenValidationModel> validator = DosenValidationModel().obs;
  bool get allowedSubmit => validator.value.isAllowedSubmit;

  String prevEmail;
  RxString _errorNama = ''.obs;
  String get errorNama => _errorNama.value == '' ? null : _errorNama.value;

  RxString _errorEmail = ''.obs;
  String get errorEmail => _errorEmail.value == '' ? null : _errorEmail.value;
  RxBool emailWarning = false.obs;

  RxString _errorKodeBimbing = ''.obs;
  String get errorKodeBimbing =>
      _errorKodeBimbing.value == '' ? null : _errorKodeBimbing.value;

  RxString _errorkodeWali = ''.obs;
  String get errorkodeWali =>
      _errorkodeWali.value == '' ? null : _errorkodeWali.value;

  RxString _errorkodeNIP = ''.obs;
  String get errorkodeNIP =>
      _errorkodeNIP.value == '' ? null : _errorkodeNIP.value;

  RxString _errorDepartemen = ''.obs;
  String get errorDepartemen =>
      _errorDepartemen.value == '' ? null : _errorDepartemen.value;

  RxString _errorROles = ''.obs;
  String get errorROles => _errorROles.value == '' ? null : _errorROles.value;

  set setPrevEmail(String value) {
    prevEmail = value;
    _errorEmail.value = '';
  }

  @override
  void onInit() {
    if (data.crudMode == CRUDMode.update) {
      prevEmail = data.user.email;
      validator(validator.value.copyWith(
        isEmailValid: true,
        isdepartemenValid: true,
        iskodeBimbingValid: true,
        iskodeWaliValid: true,
        isnamaValid: true,
        isnipValid: true,
        isroleValid: true,
      ));
    }
  }

  void validateName(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(isnamaValid: false));
      _errorNama.value = 'Nama'.isRequired;
    } else {
      validator(validator.value.copyWith(isnamaValid: true));
      _errorNama.value = '';
      Get.find<DosenDetailController>().setName(value);
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(isEmailValid: false));
      emailWarning.value = false;
      _errorEmail.value = 'Email'.isRequired;
    } else if (!value.isEmail) {
      validator(validator.value.copyWith(isEmailValid: false));
      emailWarning.value = false;
      _errorEmail.value = 'Email'.isInvalidFormat;
    } else {
      if (prevEmail != value && data.crudMode == CRUDMode.update) {
        validator(validator.value.copyWith(isEmailValid: true));
        emailWarning.value = true;
        _errorEmail.value =
            'Merubah email akan merubah password dari akun bersangkutan';
      } else {
        validator(validator.value.copyWith(isEmailValid: true));
        emailWarning.value = false;
        _errorEmail.value = '';
      }
      Get.find<DosenDetailController>().setEmail(value);
    }
  }

  void validateKodeBimbing(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(iskodeBimbingValid: false));
      _errorKodeBimbing.value = 'Kode bimbing'.isRequired;
    } else if (value.isNotBetween(4, 5)) {
      validator(validator.value.copyWith(iskodeBimbingValid: false));
      _errorKodeBimbing.value = 'kode bimbing'.lengthBetween(4, 5);
    } else {
      validator(validator.value.copyWith(iskodeBimbingValid: true));
      _errorKodeBimbing.value = '';
      Get.find<DosenDetailController>().setKodeBimbing(value);
    }
  }

  void validateKodeWali(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(iskodeWaliValid: false));
      _errorkodeWali.value = 'Kode wali'.isRequired;
    } else if (value.isNotBetween(4, 5)) {
      validator(validator.value.copyWith(iskodeWaliValid: false));
      _errorkodeWali.value = 'kode wali'.lengthBetween(4, 5);
    } else {
      validator(validator.value.copyWith(iskodeWaliValid: true));
      _errorkodeWali.value = '';
      Get.find<DosenDetailController>().setKodeWali(value);
    }
  }

  void validateNIP(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(isnipValid: false));
      _errorkodeNIP.value = 'NIP'.isRequired;
    } else if (value.isNotBetween(15, 18)) {
      validator(validator.value.copyWith(isnipValid: false));
      _errorkodeNIP.value = 'NIP'.lengthBetween(15, 18);
    } else {
      validator(validator.value.copyWith(isnipValid: true));
      _errorkodeNIP.value = "";
      Get.find<DosenDetailController>().setNIP(value);
    }
  }

  void validateDepartemen(Departemen value) {
    if (value == null) {
      validator(validator.value.copyWith(isdepartemenValid: false));
      _errorDepartemen.value = 'Departemen'.isRequired;
    } else {
      validator(validator.value.copyWith(isdepartemenValid: true));
      _errorDepartemen.value = "";
    }
    Get.find<DosenDetailController>().setDepartemen(value);
  }

  void validateRoles(List<Role> value) {
    if (value == null) {
      validator(validator.value.copyWith(isroleValid: false));
      _errorROles.value = 'Hak Akses'.isRequired;
    } else {
      validator(validator.value.copyWith(isroleValid: true));
      _errorROles.value = '';
    }
    Get.find<DosenDetailController>().setRole(value);
  }
}
