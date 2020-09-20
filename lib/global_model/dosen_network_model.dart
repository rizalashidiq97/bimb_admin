import 'authModel/User.dart';

class DosenNetworkModel {
  DosenNetworkModel({
    this.users,
  });

  List<User> users;

  factory DosenNetworkModel.fromJson(Map<String, dynamic> json) =>
      DosenNetworkModel(
        users: json["users"] == null
            ? null
            : List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );
}
