class DepartemenErrorModel {
  DepartemenErrorModel({
    this.nama,
  });

  List<String> nama;

  factory DepartemenErrorModel.fromJson(Map<String, dynamic> json) =>
      DepartemenErrorModel(
        nama: json["nama"] == null
            ? []
            : List<String>.from(json["nama"].map((x) => x)),
      );
}
