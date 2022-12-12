import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_eat/daftar_pesanan_seller/model/pesanan.dart';

Future<List<Pesanan>> fetchPesanan(request) async {
  // var url = Uri.parse(
  //     'https://share-eat-d02.up.railway.app/daftar_pesanan_seller/json/');
  // var response = await http.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );

  final data = await request
      .get('https://share-eat-d02.up.railway.app/daftar_pesanan_seller/json/');
  // .get('http://10.0.2.2:8000/daftar_pesanan_seller/json/');

  List<Pesanan> listPesanan = [];
  for (var d in data) {
    if (d != null) {
      listPesanan.add(Pesanan.fromJson(d));
    }
  }
  // print("LIST PESANAN:");
  // print(listPesanan.toString());

  return listPesanan;
}
