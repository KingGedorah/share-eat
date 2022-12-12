import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:share_eat/seller_menu/form/edit_makanan.dart';
import 'package:share_eat/seller_menu/model/makanan.dart';
import 'package:share_eat/seller_menu/page/page_makanan.dart';

import '../../widget/drawer_app.dart';

class DetailPage extends StatefulWidget {
  final Makanan makanan;
  const DetailPage({super.key, required this.makanan});
  static const ROUTE_NAME = "/detail-makanan";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  deleteMakanan(request, id) async {
    // print(request.headers.cookie);
    final response = await http.delete(
        Uri.parse(
            'https://share-eat-d02.up.railway.app/seller_menu/delete/makanan/${id}'),
        headers: request.headers);
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MakananPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Makanan'),
      ),
      drawer: DrawerApp(DetailPage.ROUTE_NAME),
      body: _showInfo(request),
    );
  }

  Widget _showInfo(request) {
    String watchStatus = "";
    return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: widget.makanan.fields.name,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // if (widget.makanan.fields.image != "") ...[
          //   Container(
          //       // child: new Image.network(
          //       //     'http://127.0.0.1:8000/static/${widget.makanan.fields.image}'),

          //       child: new InkWell(
          //     child: new Image.network(
          //       'https://share-eat-d02.up.railway.app/static/${widget.makanan.fields.image}',
          //       height: 150,
          //     ),
          //   ))
          // ],
          SizedBox(height: 10),
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: "Deskripsi: ",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.makanan.fields.description,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          )),
                    ]),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: "Harga: ",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Rp${widget.makanan.fields.harga}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          )),
                    ]),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: "Stok: ",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.makanan.fields.stok.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          )),
                    ]),
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            width: 1000,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 1000,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditMakananFormPage(makanan: widget.makanan)),
                );
              },
              child: Text(
                'Update Makanan',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 1000,
            child: TextButton(
              onPressed: () {
                deleteMakanan(request, widget.makanan.pk);
              },
              child: Text(
                'Delete Makanan',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          )
        ]));
  }
}
