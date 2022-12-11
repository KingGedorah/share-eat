import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_eat/daftar_pesanan_seller/page/lihat_pesanan_page.dart';
import 'package:share_eat/daftar_pesanan_seller/widget/drawer_app.dart';

import 'add_gratisan_page.dart';

class DaftarPesananPage extends StatefulWidget {
  const DaftarPesananPage({super.key});
  static const ROUTE_NAME = "/daftar-pesanan";

  @override
  State<DaftarPesananPage> createState() => _DaftarPesananPageState();
}

class _DaftarPesananPageState extends State<DaftarPesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Pesanan Seller',
        ),
      ),
      drawer: const DrawerApp(DaftarPesananPage.ROUTE_NAME),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text(
                    'Layani Pesananmu!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const AddGratisanPage()),
                          // builder: (context) =>
                          //     const BuatMakananFormPage()),
                        )
                      },
                      child: const Text(
                        "Add Gratisan",
                        style:
                            TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 184, 204, 162),
                        padding: const EdgeInsets.all(8.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LihatPesanan()),
                        )
                      },
                      child: const Text(
                        "Lihat Pesanan",
                        style:
                            TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 184, 204, 162),
                        padding: const EdgeInsets.all(8.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
