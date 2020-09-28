class FormDosenErrorModel {
  FormDosenErrorModel({
    this.kodeBimbing,
    this.kodeWali,
    this.nip,
  });

  List<String> kodeBimbing;
  List<String> kodeWali;
  List<String> nip;

  factory FormDosenErrorModel.fromJson(Map<String, dynamic> json) =>
      FormDosenErrorModel(
        kodeBimbing: json["kode_bimbing"] == null ? [] : List<String>.from(json["kode_bimbing"].map((x) => x)),
        kodeWali: json["kode_wali"] == null ? [] : List<String>.from(json["kode_wali"].map((x) => x)),
        nip: json["nip"] == null ? [] : List<String>.from(json["nip"].map((x) => x)),
      );
}
