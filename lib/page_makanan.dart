import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share_eat/model/makanan_model.dart';
import 'package:flutter/material.dart';
import 'package:share_eat/drawer/drawer.dart';
import 'package:share_eat/main.dart';
import 'package:share_eat/fetch/get_makanan.dart';
import 'package:share_eat/login.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:share_eat/form/buat_makanan.dart';
import 'package:share_eat/page/detail_makanan.dart';

class MakananPage extends StatefulWidget {
  const MakananPage({Key? key}) : super(key: key);

  @override
  _MakananPageState createState() => _MakananPageState();
}

class _MakananPageState extends State<MakananPage> {
  bool _isInit = true;

  changeIsInit(request) {
    _isInit = false;
    return fetchMakanan(request);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    bool newValue = false;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Daftar Makanan"),
        ),
        drawer: DrawerWidget(),
        body: FutureBuilder(
            future: _isInit ? changeIsInit(request) : null,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data.length == 0) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Tidak ada makanan yang terdaftar",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                        ),
                      ]);
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 2.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(makanan: snapshot.data![index])),
                        );
                      },
                    ),
                  );
                }
              }
            }));
  }
}
