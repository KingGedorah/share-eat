// To parse this JSON data, do
//
// final menuPage = menuPageFromJSOn(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CatatanUser> cartPageFromJson(String str) => List<CatatanUser>.from(json.decode(str).map((x) => CatatanUser.fromJson(x))); 

String cartPageToJson(List<CatatanUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatatanUser {
  CatatanUser({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory CatatanUser.fromJson(Map<String, dynamic> json) => CatatanUser( 
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
    required this.keranjang,
    required this.catatanPesanan,

  });
  int keranjang;
  String catatanPesanan;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    keranjang: json["keranjang"],
    catatanPesanan: json["catatanPesanan"],
  );

  Map<String, dynamic> toJson() => {
    "keranjang": keranjang,
    "catatanPesanan" : catatanPesanan,
  };

}

