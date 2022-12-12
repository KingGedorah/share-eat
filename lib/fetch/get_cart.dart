import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/cart_model.dart';

Future<List<CartUser>> fetchCartUser(id) async {
  var url = Uri.parse('https://share-eat-d02.up.railway.app/fitur_keranjang/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<CartUser> listCart = [];
  for(var d in data) {
    if (d != null && CartUser.fromJson(d).fields.keranjang == id) {
      listCart.add(CartUser.fromJson(d));
    }
  }

  print(listCart);
  return listCart;
}