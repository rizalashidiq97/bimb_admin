import '../../util/extension/string_extension.dart';

class Role {
  Role({
    this.name,
  });

  String name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json["name"] == null ? null : json["name"].toString().toCapital,
      );
}
