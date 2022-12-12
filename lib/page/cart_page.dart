import 'package:flutter/foundation.dart';
import 'package:share_eat/form/buat_catatan.dart';
import 'package:share_eat/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/catatan_model.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:share_eat/drawer/drawer.dart';


class UserCartPage extends StatefulWidget {
  // final CartUser cartUser;
  const UserCartPage({super.key});

  
  @override
  State<UserCartPage> createState() => __UserCartPageState();
}

class __UserCartPageState extends State<UserCartPage> {
  Future<List<CartUser>> fetchCartUser(request) async {
  var url = await request.get('http://127.0.0.1:8000/fitur_keranjang/json/');
  // var response = await request.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );

  // var data =jsonDecode(utf8.decode(url.bodyBytes));

  List<CartUser> listCart = [];
  for(var d in url["data"]) {
    if (d != null) {
      listCart.add(CartUser.fromJson(d));
    }
  }

  if (listCart.isEmpty) {
    print("Kosong");
  } else {
    print("Berhasil");
  }
  print(listCart);
  return listCart;
  }
  
  Future<List<CatatanUser>> fetchCatatanUser(request) async {
  var url = await request.get('http://127.0.0.1:8000/fitur_keranjang/json_catatan/');
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

  print(listCatatan);
  return listCatatan;
}

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjangku"),
      ),
      drawer: DrawerWidget (),
      body: FutureBuilder(
          future: fetchCartUser(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada item di keranjangmu! :(",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                  ],
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
                                          "Menu : ${snapshot.data![index].fields.makanan.name}",
                                          style: const TextStyle(
                                            fontSize: 17.0
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15, top: 10), 
                                        child: Text(
                                          "Deskripsi : ${snapshot.data![index].fields.makanan.description}",
                                          style: const TextStyle(
                                            fontSize: 17.0
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15, top: 10), 
                                        child: Text(
                                          "Seller : ${snapshot.data![index].fields.makanan.seller}",
                                          style: const TextStyle(
                                            fontSize: 17.0
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15, top: 10), 
                                        child: Text(
                                          "Harga : ${snapshot.data![index].fields.makanan.harga}",
                                          style: const TextStyle(
                                            fontSize: 17.0
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15, top: 10), 
                                        child: Text(
                                          "Quantity : ${snapshot.data![index].fields.add_cart}",
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

