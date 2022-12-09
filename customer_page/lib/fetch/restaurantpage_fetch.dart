import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/restaurant_model.dart';

Future<List<RestaurantPage>> fetchRestaurantPage() async {
  var url = Uri.parse(
      'https://share-eat-d02.up.railway.app/order-page_for_cust/json/');
  //Uri.parse('https://share-eat-d02.up.railway.app/loginpage/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<RestaurantPage> listResto = [];
  for (var d in data) {
    if (d != null) {
      listResto.add(RestaurantPage.fromJson(d));
    }
  }
  return listResto;
}
