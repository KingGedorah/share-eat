// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

List<Profile> profileFromJson(String str) =>
    List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  Profile({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.name,
    required this.alamat,
    required this.noTelp,
  });

  String name;
  String alamat;
  String noTelp;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alamat": alamat,
        "no_telp": noTelp,
      };
}
