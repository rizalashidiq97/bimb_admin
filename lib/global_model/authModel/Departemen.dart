import '../../util/extension/string_extension.dart';

class Departemen {
  Departemen({this.id, this.nama});

  int id;
  String nama;

  factory Departemen.fromJson(Map<String, dynamic> json) => Departemen(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"].toString().toCapital,
      );

  Departemen copyWith({
    int id,
    String nama,
  }) {
    return Departemen(id: id ?? this.id, nama: nama ?? this.nama);
  }

  @override
  String toString() {
    return """Departemen(
          id : ${this.id},
          nama :${this.nama})
    """;
  }
}
