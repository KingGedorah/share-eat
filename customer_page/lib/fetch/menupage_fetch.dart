import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/menu_model.dart';

Future<List<MenuPage>> fetchMenuPage() async {
  var url = Uri.parse(
      'https://share-eat-d02.up.railway.app/order-page_for_cust/json-menu/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MenuPage> listMenu = [];
  for (var d in data) {
    if (d != null) {
      listMenu.add(MenuPage.fromJson(d));
    }
  }
  return listMenu;
}
