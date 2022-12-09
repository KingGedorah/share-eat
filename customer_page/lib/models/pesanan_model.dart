// To parse this JSON data, do
//
//     final pesanan = pesananFromJson(jsonString);

import 'dart:convert';

List<Pesanan> pesananFromJson(String str) => List<Pesanan>.from(json.decode(str).map((x) => Pesanan.fromJson(x)));

String pesananToJson(List<Pesanan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pesanan {
    Pesanan({
        required this.model,
        required this.pk,
        required this.fields,
    });

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
        required this.user,
        required this.addCart,
        required this.keranjang,
        required this.makanan,
    });

    int user;
    int addCart;
    int keranjang;
    int makanan;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        addCart: json["add_cart"],
        keranjang: json["keranjang"],
        makanan: json["makanan"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "add_cart": addCart,
        "keranjang": keranjang,
        "makanan": makanan,
    };
}
