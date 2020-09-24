class DosenValidationModel {
  final String emailError;
  final String kodeBimbingError;
  final String kodeWaliError;
  final String nipError;
  final String namaError;
  final String departemenError;
  final String roleError;
  final bool isEmailValid;
  final bool iskodeBimbingValid;
  final bool iskodeWaliValid;
  final bool isnipValid;
  final bool isnamaValid;
  final bool isdepartemenValid;
  final bool isroleValid;

  DosenValidationModel({
    this.isEmailValid = false,
    this.iskodeBimbingValid = false,
    this.iskodeWaliValid = false,
    this.isnipValid = false,
    this.isnamaValid = false,
    this.isdepartemenValid = false,
    this.isroleValid = false,
    this.emailError,
    this.kodeBimbingError,
    this.kodeWaliError,
    this.nipError,
    this.namaError,
    this.departemenError,
    this.roleError,
  });

  bool get isAllowedSubmit =>
      this.isEmailValid == true &&
      this.isnamaValid == true &&
      this.iskodeBimbingValid == true &&
      this.iskodeWaliValid == true &&
      this.isdepartemenValid == true &&
      this.isnipValid == true &&
      this.isroleValid == true;

  DosenValidationModel copyWith({
    String emailError,
    String kodeBimbingError,
    String kodeWaliError,
    String nipError,
    String namaError,
    String departemenError,
    String roleError,
    bool isEmailValid,
    bool iskodeBimbingValid,
    bool iskodeWaliValid,
    bool isnipValid,
    bool isnamaValid,
    bool isdepartemenValid,
    bool isroleValid,
  }) {
    return DosenValidationModel(
      emailError: emailError == '' ? null : emailError,
      kodeBimbingError: kodeBimbingError == '' ? null : kodeBimbingError,
      kodeWaliError: kodeWaliError == '' ? null : kodeWaliError,
      nipError: nipError == '' ? null : nipError,
      namaError: namaError == '' ? null : namaError,
      departemenError: departemenError == '' ? null : departemenError,
      roleError: roleError == '' ? null : roleError,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      iskodeBimbingValid: iskodeBimbingValid ?? this.iskodeBimbingValid,
      iskodeWaliValid: iskodeWaliValid ?? this.iskodeWaliValid,
      isnipValid: isnipValid ?? this.isnipValid,
      isnamaValid: isnamaValid ?? this.isnamaValid,
      isdepartemenValid: isdepartemenValid ?? this.isdepartemenValid,
      isroleValid: isroleValid ?? this.isroleValid,
    );
  }
}
