import 'package:flutter/material.dart';
import 'package:share_eat/form/buat_makanan.dart';
import 'package:share_eat/main.dart';
import 'package:share_eat/login.dart';
import 'package:share_eat/page_makanan.dart';
import 'package:share_eat/page/cart_page.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          // ListTile(
          //   title: const Text('counter_7'),
          //   onTap: () {
          //     // Route menu ke halaman utama
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const MyHomePage()),
          //     );
          //   },
          // ),
          ListTile(
            title: const Text('Auth'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Seller Page'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MakananPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Makanan'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BuatMakananFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Keranjangku'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const UserCartPage()),
              );
            },
          ),
        ],
      ),
    );

    //   body: Center(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 50,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
