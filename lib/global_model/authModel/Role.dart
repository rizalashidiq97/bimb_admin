import '../../util/extension/string_extension.dart';

class Role {
  Role({this.name, this.id, this.checked});

  String name;
  int id;
  bool checked;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null
            ? null
            : json["name"]
                .toString()
                .toCapital
                .replaceAll(RegExp('[\\_]+'), ' '),
      );

  @override
  String toString() {
    return """Role(
      name :${this.name},
      id : ${this.id},
      checked : ${this.checked})
    """;
  }
}
