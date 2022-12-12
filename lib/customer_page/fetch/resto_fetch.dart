import 'package:http/http.dart' as http;
import 'package:share_eat/customer_page/model/restopage.dart';
import 'dart:convert';

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
