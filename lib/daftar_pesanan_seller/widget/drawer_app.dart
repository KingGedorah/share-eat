import 'package:flutter/material.dart';
import 'package:share_eat/daftar_pesanan_seller/login.dart';
import 'package:share_eat/daftar_pesanan_seller/page/daftar_pesanan_page.dart';
import 'package:share_eat/daftar_pesanan_seller/page/home_page.dart';

class DrawerApp extends StatelessWidget {
  final String route;

  const DrawerApp(this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<NetworkService>();
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // ignore: sized_box_for_whitespace
          Container(
            color: Color.fromRGBO(97, 118, 75, 1),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: 57,
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(97, 118, 75, .3),
                  ),
                  child: Center(
                    child: Text(
                      'SHAREEAT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Homepage'),
            onTap: () {
              route == HomePage.ROUTE_NAME
                  ? Navigator.pop(context)
                  : Navigator.pushReplacementNamed(
                      context, HomePage.ROUTE_NAME);
            },
          ),
          ListTile(
            title: const Text('Loginpage'),
            onTap: () {
              route == LoginPage.ROUTE_NAME
                  ? Navigator.pop(context)
                  : Navigator.pushReplacementNamed(
                      context, LoginPage.ROUTE_NAME);
            },
          ),
          ListTile(
            title: const Text('Daftar Pesanan Seller'),
            onTap: () {
              route == DaftarPesananPage.ROUTE_NAME
                  ? Navigator.pop(context)
                  : Navigator.pushReplacementNamed(
                      context, DaftarPesananPage.ROUTE_NAME);
            },
          ),
        ],
      ),
    );
  }
}
