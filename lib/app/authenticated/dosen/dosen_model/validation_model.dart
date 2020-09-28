class DosenValidationModel {
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
    bool isEmailValid,
    bool iskodeBimbingValid,
    bool iskodeWaliValid,
    bool isnipValid,
    bool isnamaValid,
    bool isdepartemenValid,
    bool isroleValid,
  }) {
    return DosenValidationModel(
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
