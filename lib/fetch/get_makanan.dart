import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share_eat/model/makanan_model.dart';
import 'package:share_eat/main.dart';

Future<List<Makanan>> fetchMakanan(request) async {
  // var url = Uri.parse('http://127.0.0.1:8000/seller_menu/makanan/json');
  // var response = await http.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );
  final response = await request
      .get('https://share-eat-d02.up.railway.app/seller_menu/makanan/json');
  print(response);
  // melakukan decode response menjadi bentuk json
  // var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Makanan> listMakanan = [];
  for (var d in response) {
    if (d != null) {
      print(Makanan.fromJson(d).fields.name);
      listMakanan.add(Makanan.fromJson(d));
    }
  }
  return listMakanan;
}
