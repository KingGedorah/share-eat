import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_eat/daftar_pesanan_seller/widget/drawer_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const ROUTE_NAME = '/home';

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo, ShareEaters!',
        ),
      ),
      drawer: const DrawerApp(HomePage.ROUTE_NAME),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text(
                    'Selamat Datang',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
