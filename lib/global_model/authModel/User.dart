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

  Map<String, dynamic> toJson() {
    return {
      "kode_bimbing": this.dosen.kodeBimbing,
      "kode_wali": this.dosen.kodeWali,
      "nip": this.dosen.nip,
      "nama": this.dosen.nama,
      "departemen_id": this.departemen.id,
      "email": this.email,
      "roles": List<dynamic>.from(this.roles.map((e) => e.id))
    };
  }

  User setName(String value) =>
      this.copyWith(dosen: this.dosen.copyWith(nama: value));
  User setEmail(String value) => this.copyWith(email: value);
  User setKodeBimbing(String value) =>
      this.copyWith(dosen: this.dosen.copyWith(kodeBimbing: int.parse(value)));
  User setKodeWali(String value) =>
      this.copyWith(dosen: this.dosen.copyWith(kodeWali: int.parse(value)));
  User setNIP(String value) =>
      this.copyWith(dosen: this.dosen.copyWith(nip: value));

  User copyWith({
    int id,
    String name,
    String email,
    Dosen dosen,
    Departemen departemen,
    List<Role> roles,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      dosen: dosen ?? this.dosen,
      departemen: departemen ?? this.departemen,
      roles: roles ?? this.roles,
    );
  }

  @override
  String toString() {
    return """User(
      id : ${this.id},
      name :${this.name},
      email :${this.email},
      dosen : ${this.dosen},
      departemen : ${this.departemen},
      roles : ${this.roles})
    """;
  }
}
