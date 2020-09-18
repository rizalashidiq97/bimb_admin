class LoginData {
  final String email;
  final String password;

  LoginData({this.email, this.password});

  LoginData copyWith({String email, String password}) {
    return LoginData(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this?.email,
      'password': this?.password,
    };
  }
}
