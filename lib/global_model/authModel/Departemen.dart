class Departemen {
  Departemen({
    this.id,
    this.nama,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String nama;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Departemen.fromJson(Map<String, dynamic> json) => Departemen(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );
}
