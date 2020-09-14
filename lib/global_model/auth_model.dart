import 'authModel/User.dart';

class AuthData {
  int id;
  String name;
  String email;

  AuthData({
    this.email,
    this.name,
    this.id,
  });
}

class NetworkAuthModel {
  NetworkAuthModel({
    this.accessToken,
    this.tokenType,
    this.expiredAt,
    this.user,
  });

  String accessToken;
  String tokenType;
  DateTime expiredAt;
  User user;

  Map<String, dynamic> toMap() {
    return {
      'email': this.user.email,
      'name': this.user.name,
      'userId': this.user.id,
    };
  }

  factory NetworkAuthModel.fromJson(Map<String, dynamic> json) =>
      NetworkAuthModel(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiredAt: json["expired_at"] == null
            ? null
            : DateTime.parse(json["expired_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}
