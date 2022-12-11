import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/catatan_model.dart';

Future<List<CatatanUser>> fetchCartUser(keranjang) async {
  var url = Uri.parse('https://share-eat-d02.up.railway.app/fitur_keranjang/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<CatatanUser> listCatatan = [];
  for(var d in data) {
    if (d != null && CatatanUser.fromJson(d).fields.keranjang == keranjang) {
      listCatatan.add(CatatanUser.fromJson(d));
    }
  }

  print(listCatatan);
  return listCatatan;
}