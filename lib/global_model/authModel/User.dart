import 'package:bimbingan_kuy_admin/global_model/dosenModel/Dosen.dart';

import 'Departemen.dart';
import 'Role.dart';

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.departemen,
    this.roles,
    this.dosen,
  });

  int id;
  String name;
  String email;
  Dosen dosen;
  Departemen departemen;
  List<Role> roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        departemen: json["departemen"] == null
            ? null
            : Departemen.fromJson(json["departemen"]),
        dosen: json["dosen"] == null ? null : Dosen.fromJson(json["dosen"]),
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );
}
