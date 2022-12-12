import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_eat/customer_page/page/restopage.dart';
// import 'package:share_eat/daftar_pesanan_seller/login.dart';
import 'package:share_eat/daftar_pesanan_seller/page/daftar_pesanan_page.dart';
import 'package:share_eat/fitur_cart/form/buat_catatan.dart';
import 'package:share_eat/fitur_cart/page/cart_page.dart';
import 'package:share_eat/fitur_cart/page/catatan_page.dart';
import 'package:share_eat/loginpage/page/loginpage.dart';
import 'package:share_eat/loginpage/page/profile_page_cust.dart';
import 'package:share_eat/page/home_page.dart';
import 'package:share_eat/page/homepage_customer.dart';
import 'package:share_eat/seller_menu/form/buat_makanan.dart';

import '../seller_menu/page/page_makanan.dart';

class DrawerCust extends StatelessWidget {
  final String route;

  const DrawerCust(this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
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
          (request.loggedIn)
              ? ListTile(
                  tileColor: Color.fromARGB(255, 233, 193, 190),
                  title: const Text('Logout'),
                  onTap: () async {
                    // print("HERE");
                    await request.logout(
                        'https://share-eat-d02.up.railway.app/landing_page/logout/flutter/');
                    // 'http://10.0.2.2:8000/landing_page/logout/flutter/');
                    // print(request.loggedIn);
                    Navigator.pushReplacementNamed(
                        context, HomePage.ROUTE_NAME);
                  },
                )
              : ListTile(
                  tileColor: Color.fromARGB(255, 190, 233, 196),
                  title: const Text('Login'),
                  onTap: () {
                    route == LoginPage.ROUTE_NAME
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(
                            context, LoginPage.ROUTE_NAME);
                  },
                ),
          ListTile(
            title: const Text('Homepage'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePageCust.ROUTE_NAME);
            },
          ),
          ListTile(
            title: const Text('Profile Page'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ListTile(
              title: const Text('Order Page'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyRestaurantPage()),
                );
              }),
          ListTile(
            title: const Text('Keranjang'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UserCartPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Lihat Catatan'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const UserCatatanPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Catatan'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const BuatCatatanFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
