import 'Departemen.dart';
import 'Role.dart';

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.emailVerifiedAt,
    this.activatedAt,
    this.departemen,
    this.roles,
  });

  int id;
  String name;
  String email;
  String avatar;
  DateTime emailVerifiedAt;
  DateTime activatedAt;
  Departemen departemen;
  List<Role> roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        activatedAt: json["activated_at"] == null
            ? null
            : DateTime.parse(json["activated_at"]),
        departemen: json["departemen"] == null
            ? null
            : Departemen.fromJson(json["departemen"]),
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );
}
