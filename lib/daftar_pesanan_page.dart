import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'drawer_app.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
              TextButton(
                onPressed: () => {},
                child: const Text(
                  "Add Gratisan",
                  style: TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
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
      ),
    );
  }
}
