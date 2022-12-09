import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pesanan_model.dart';

Future<List<Pesanan>> fetchPesanan() async {
  var url = Uri.parse(
      'https://share-eat-d02.up.railway.app/order-page_for_cust/json-pesanan/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Pesanan> listPesanan = [];
  for (var d in data) {
    if (d != null) {
      listPesanan.add(Pesanan.fromJson(d));
    }
  }
  return listPesanan;
}
