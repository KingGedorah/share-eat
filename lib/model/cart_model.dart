// To parse this JSON data, do
//
// final menuPage = menuPageFromJSOn(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:share_eat/model/makanan_model.dart';

List<CartUser> cartPageFromJson(String str) => List<CartUser>.from(json.decode(str).map((x) => CartUser.fromJson(x))); 

String cartPageToJson(List<CartUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartUser {
  CartUser({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory CartUser.fromJson(Map<String, dynamic> json) => CartUser(
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
    required this.add_cart,
    required this.keranjang,
    required this.makanan,

  });
  int user;
  int add_cart;
  String keranjang;
  Makanan makanan;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    add_cart: json["add_cart"],
    keranjang: json["keranjang"],
    makanan: Makanan.fromJson(json["makanan"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "add_cart": add_cart,
    "keranjang": keranjang,
    "makanan" : makanan,
  };

}

class Makanan {
    Makanan({
      required this.name,
      required this.seller,
      required this.description,
      required this.stok,
      required this.harga,
      required this.image,
    });
    
    String name;
    String image;
    String description;
    int seller;
    int harga;
    int stok;

    factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
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

