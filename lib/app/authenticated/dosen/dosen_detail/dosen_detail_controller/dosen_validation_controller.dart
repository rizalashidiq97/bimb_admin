import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_model/validation_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Role.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import '../../../../../util/extension/string_extension.dart';
import 'package:get/get.dart';

class DosenValidationController extends GetxController {
  final CRUDMode crudMode;
  DosenValidationController({this.crudMode});

  Rx<DosenValidationModel> validator = DosenValidationModel().obs;
  bool get allowedSubmit => validator.value.isAllowedSubmit;

  @override
  void onInit() {
    if (crudMode == CRUDMode.update) {
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
      validator(validator.value.copyWith(
        namaError: 'Nama'.isRequired,
        isnamaValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        namaError: '',
        isnamaValid: true,
      ));
    }
    Get.find<DosenDetailController>().setName(value);
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(
        emailError: 'Email'.isRequired,
        isEmailValid: false,
      ));
    } else if (!value.isEmail) {
      validator(validator.value.copyWith(
        emailError: 'Email'.isInvalidFormat,
        isEmailValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        emailError: '',
        isEmailValid: true,
      ));
    }
    Get.find<DosenDetailController>().setEmail(value);
  }

  void validateKodeBimbing(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(
        kodeBimbingError: 'Kode bimbing'.isRequired,
        iskodeBimbingValid: false,
      ));
    } else if (value.isNotBetween(4, 5)) {
      validator(validator.value.copyWith(
        kodeBimbingError: 'kode bimbing'.lengthBetween(4, 5),
        iskodeBimbingValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        kodeBimbingError: '',
        iskodeBimbingValid: true,
      ));
    }
    Get.find<DosenDetailController>().setKodeBimbing(value);
  }

  void validateKodeWali(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(
        kodeWaliError: 'Kode wali'.isRequired,
        iskodeWaliValid: false,
      ));
    } else if (value.isNotBetween(4, 5)) {
      validator(validator.value.copyWith(
        kodeWaliError: 'kode wali'.lengthBetween(4, 5),
        iskodeWaliValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        kodeWaliError: '',
        iskodeWaliValid: true,
      ));
    }
    Get.find<DosenDetailController>().setKodeWali(value);
  }

  void validateNIP(String value) {
    if (value.isEmpty) {
      validator(validator.value.copyWith(
        nipError: 'NIP'.isRequired,
        isnipValid: false,
      ));
    } else if (value.isNotBetween(15, 18)) {
      validator(validator.value.copyWith(
        nipError: 'NIP'.lengthBetween(15, 18),
        isnipValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        nipError: '',
        isnipValid: true,
      ));
    }
    Get.find<DosenDetailController>().setNIP(value);
  }

  void validateDepartemen(Departemen value) {
    if (value == null) {
      validator(validator.value.copyWith(
        departemenError: 'Departemen'.isRequired,
        isdepartemenValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        departemenError: '',
        isdepartemenValid: true,
      ));
    }

    Get.find<DosenDetailController>().setDepartemen(value);
  }

  void validateRoles(List<Role> value) {
    if (value == null) {
      validator(validator.value.copyWith(
        roleError: 'Hak Akses'.isRequired,
        isroleValid: false,
      ));
    } else {
      validator(validator.value.copyWith(
        roleError: '',
        isroleValid: true,
      ));
    }

    Get.find<DosenDetailController>().setRole(value);
  }
}
