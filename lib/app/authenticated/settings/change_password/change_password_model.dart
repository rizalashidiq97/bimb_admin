class PasswordErrorModel {
  PasswordErrorModel({
    this.password,
  });

  String password;

  factory PasswordErrorModel.fromJson(Map<String, dynamic> json) =>
      PasswordErrorModel(
        password: json["password"] == null ? null : json["password"],
      );
}
