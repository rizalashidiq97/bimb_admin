import '../../util/extension/string_extension.dart';

class Departemen {
  Departemen({this.id, this.nama});

  int id;
  String nama;

  factory Departemen.fromJson(Map<String, dynamic> json) => Departemen(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"].toString().toCapital,
      );
  Map<String, dynamic> toMap() {
    return {
      "id": this?.id,
      "nama": this?.nama,
    };
  }

  static Departemen fromMap(Map<String, dynamic> data) {
    return Departemen(id: data['id'], nama: data['nama']);
  }

  Departemen copyWith({
    int id,
    String nama,
  }) =>
      Departemen(
        id: id ?? this.id,
        nama: nama ?? this.nama,
      );

  @override
  String toString() {
    return """Departemen(
          id : ${this.id},
          nama :${this.nama})
    """;
  }
}
