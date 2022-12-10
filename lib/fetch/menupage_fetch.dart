import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/menu_model.dart';
import '../model/restaurant_model.dart';

Future<List<MenuPage>> fetchMenuPage(id) async {
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
  // MenuPage? menuPage;
  // RestaurantPage? restaurantPage;
  // MenuPage? menuPage;

  List<MenuPage> listMenu = [];
  for (var d in data) {
    if (d != null && MenuPage.fromJson(d).fields.seller == id) {
      listMenu.add(MenuPage.fromJson(d));
    }
  }
  //print(response);
  print(listMenu);
  return listMenu;
// var i = fetchMenuPage();
}
