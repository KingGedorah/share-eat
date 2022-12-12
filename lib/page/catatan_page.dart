import 'package:flutter/foundation.dart';
import 'package:share_eat/form/buat_catatan.dart';
import 'package:share_eat/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/catatan_model.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:share_eat/widget/drawer_cust.dart';


class UserCatatanPage extends StatefulWidget {
  // final CartUser cartUser;
  const UserCatatanPage({super.key});
  static const ROUTE_NAME = 'route';
  
  @override
  State<UserCatatanPage> createState() => __UserCatatanPageState();
}
class __UserCatatanPageState extends State<UserCatatanPage> {

  
  Future<List<CatatanUser>> fetchCatatanUser(request) async {
  var url = await request.get('https://share-eat-d02.up.railway.app/fitur_keranjang/json_catatan/');
  // var response = await request.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );

  // var data = jsonDecode(utf8.decode(url.bodyBytes));

  List<CatatanUser> listCatatan = [];
  for(var d in url) {
    if (d != null) {
      listCatatan.add(CatatanUser.fromJson(d));
    }
  }

  print("berhasil");

  print(listCatatan);
  return listCatatan;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatanku"),
      ),
      drawer: DrawerCust(UserCatatanPage.ROUTE_NAME),
      body: FutureBuilder(
          future: fetchCatatanUser(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data.length == 0) {
                return OutlinedButton(
                        child: (
                          Text('Tambah Catatan')
                        ),
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => BuatCatatanFormPage()));
                        },
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Card(
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15, top: 10), 
                                        child: Text(
                                          "Catatan : ${snapshot.data![index].fields.catatanPesanan}",
                                          style: const TextStyle(
                                            fontSize: 17.0
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                )
                              )
                            ],
                          ),
                        )
                      ),
                );
              }
            }
          }),
      );
  }
}