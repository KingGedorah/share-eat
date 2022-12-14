import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
// import 'package:share_eat/daftar_pesanan_seller/login.dart';
import 'package:share_eat/daftar_pesanan_seller/page/add_gratisan_page.dart';
import 'package:share_eat/daftar_pesanan_seller/page/daftar_pesanan_page.dart';
import 'package:share_eat/daftar_pesanan_seller/page/lihat_pesanan_page.dart';
import 'package:share_eat/seller_menu/page/page_makanan.dart';
import 'package:share_eat/widget/drawer_app.dart';

class HomePageResto extends StatelessWidget {
  const HomePageResto({super.key});
  static const ROUTE_NAME = '/home-resto';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homepage',
        ),
      ),
      drawer: const DrawerApp(HomePageResto.ROUTE_NAME),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text(
                    'Selamat Datang, \nPartner!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/share-bg.jpg',
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Apa yang ingin kamu lakukan?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MakananPage()),
                          // builder: (context) =>
                          //     const BuatMakananFormPage()),
                        )
                      },
                      child: const Text(
                        "Seller Page",
                        style:
                            TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 184, 204, 162),
                          padding: const EdgeInsets.all(8.0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.center,
                          fixedSize: Size(120, 40)),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const DaftarPesananPage()),
                        )
                      },
                      child: const Text(
                        "Daftar Pesanan",
                        style:
                            TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 184, 204, 162),
                        padding: const EdgeInsets.all(8.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        fixedSize: Size(120, 40),
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
