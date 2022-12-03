// To parse this JSON data, do
//
//     final restaurantPage = restaurantPageFromJson(jsonString);

import 'dart:convert';

List<RestaurantPage> restaurantPageFromJson(String str) => List<RestaurantPage>.from(json.decode(str).map((x) => RestaurantPage.fromJson(x)));

String restaurantPageToJson(List<RestaurantPage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantPage {
  RestaurantPage({
    this.model,
    this.pk,
    this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory RestaurantPage.fromJson(Map<String, dynamic> json) => RestaurantPage(
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
    this.name,
    this.alamat,
    this.noTelp,
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
