import 'package:share-eat/customer_page/model/customer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<CustomerPage>> fetchCustomerPage() async {

  var url =
      Uri.parse('https://share-eat-d02.up.railway.app/seller_menu/makanan/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<CustomerPage> listMenu = [];
  for (var d in data) {
    if (d != null) {
      listMenu.add(CustomerPage.fromJson(d));
    }
  }
  return listMenu;
}