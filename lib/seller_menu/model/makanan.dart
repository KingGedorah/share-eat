// To parse this JSON data, do
//
//     final makanan = makananFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Makanan> makananFromJson(String str) =>
    List<Makanan>.from(json.decode(str).map((x) => Makanan.fromJson(x)));

String makananToJson(List<Makanan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Makanan {
  Makanan({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
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
