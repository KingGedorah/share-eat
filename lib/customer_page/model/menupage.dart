// To parse this JSON data, do
//
//     final menuPage = menuPageFromJson(jsonString);

import 'dart:convert';

List<MenuPage> menuPageFromJson(String str) =>
    List<MenuPage>.from(json.decode(str).map((x) => MenuPage.fromJson(x)));

String menuPageToJson(List<MenuPage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuPage {
  MenuPage({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory MenuPage.fromJson(Map<String, dynamic> json) => MenuPage(
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
    required this.image,
    required this.description,
    required this.seller,
    required this.harga,
    required this.stok,
  });

  String name;
  String image;
  String description;
  int seller;
  int harga;
  int stok;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        seller: json["seller"],
        harga: json["harga"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "seller": seller,
        "harga": harga,
        "stok": stok,
      };
}
