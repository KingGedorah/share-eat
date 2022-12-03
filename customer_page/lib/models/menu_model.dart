import 'dart:convert';

List<CustomerPage> customerPageFromJson(String str) => List<CustomerPage>.from(json.decode(str).map((x) => CustomerPage.fromJson(x)));

String customerPageToJson(List<CustomerPage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerPage {
  CustomerPage({
    this.model,
    this.pk,
    this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory CustomerPage.fromJson(Map<String, dynamic> json) => CustomerPage(
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
    this.image,
    this.description,
    this.seller,
    this.harga,
    this.stok,
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
