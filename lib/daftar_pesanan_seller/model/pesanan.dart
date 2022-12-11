// To parse this JSON data, do
//
//     final pesanan = pesananFromJson(jsonString);

import 'dart:convert';

List<Pesanan> pesananFromJson(String str) =>
    List<Pesanan>.from(json.decode(str).map((x) => Pesanan.fromJson(x)));

String pesananToJson(List<Pesanan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pesanan {
  Pesanan({
    required this.model,
    required this.pk,
    required this.fields,
  });

  static int idCounter = 0;
  String model;
  int pk;
  Fields fields;

  factory Pesanan.fromJson(Map<String, dynamic> json) => Pesanan(
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
    required this.seller,
    required this.date,
    required this.name,
    required this.description,
    required this.makanan,
  });

  int seller;
  DateTime date;
  String name;
  String description;
  int makanan;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        seller: json["seller"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        description: json["description"],
        makanan: json["makanan"],
      );

  Map<String, dynamic> toJson() => {
        "seller": seller,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "description": description,
        "makanan": makanan,
      };
}
