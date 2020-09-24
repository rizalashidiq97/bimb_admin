class Dosen {
  Dosen({
    this.id,
    this.kodeBimbing,
    this.kodeWali,
    this.nip,
    this.nama,
    this.departemenId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int kodeBimbing;
  int kodeWali;
  String nip;
  String nama;
  int departemenId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        id: json["id"] == null ? null : json["id"],
        kodeBimbing: json["kode_bimbing"] == null ? null : json["kode_bimbing"],
        kodeWali: json["kode_wali"] == null ? null : json["kode_wali"],
        nip: json["nip"] == null ? null : json["nip"],
        nama: json["nama"] == null ? null : json["nama"],
        departemenId:
            json["departemen_id"] == null ? null : json["departemen_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Dosen copyWith({
    int id,
    int kodeBimbing,
    int kodeWali,
    String nip,
    String nama,
    int departemenId,
    int userId,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Dosen(
        id: id ?? this.id,
        kodeBimbing: kodeBimbing ?? this.kodeBimbing,
        kodeWali: kodeWali ?? this.kodeWali,
        nip: nip ?? this.nip,
        nama: nama ?? this.nama,
        departemenId: departemenId ?? this.departemenId,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  String toString() {
    return """Dosen(
          id : ${this.id},
          kodeBimbing :${this.kodeBimbing},
          kodeWali :${this.kodeWali},
          nip : ${this.nip},
          nama : ${this.nama},
          departemenId : ${this.departemenId},
          userId : ${this.userId},
          createdAt: ${this.createdAt},
          updatedAt: ${this.updatedAt},)
    """;
  }
}
