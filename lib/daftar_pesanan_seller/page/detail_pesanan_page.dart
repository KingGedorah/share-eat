import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_eat/daftar_pesanan_seller/model/pesanan.dart';
import 'package:share_eat/daftar_pesanan_seller/widget/drawer_app.dart';

import 'add_gratisan_page.dart';
import 'lihat_pesanan_page.dart';

class DetailPesananPage extends StatelessWidget {
  DetailPesananPage({super.key, required this.pesanan});

  static const ROUTE_NAME = "/detail-pesanan";
  final Pesanan? pesanan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pesanan',
        ),
      ),
      drawer: const DrawerApp(DetailPesananPage.ROUTE_NAME),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 2,
                      color: Color.fromARGB(255, 184, 204, 162),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)),
                              // color: Color.fromARGB(255, 72, 90, 53),
                              color: Color(0xFF61764B),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Nama Makanan: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ((pesanan == null)
                                            ? "NULL"
                                            : pesanan!.fields.name),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Nama Pelanggan: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ((pesanan == null)
                                            ? "NULL"
                                            : pesanan!.fields.description),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Tanggal Pemesanan: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ((pesanan == null)
                                            ? "NULL"
                                            : pesanan!.fields.date
                                                .toString()
                                                .substring(0, 10)),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0)),
                              // color: Color.fromARGB(255, 72, 90, 53),
                              color: Color(0xFF61764B),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, LihatPesanan.ROUTE_NAME),
                  child: const Text(
                    "Kembali",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF61764B),
                    padding: const EdgeInsets.all(8.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
