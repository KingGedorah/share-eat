import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_eat/daftar_pesanan_seller/login.dart';
import 'package:share_eat/daftar_pesanan_seller/page/add_gratisan_page.dart';
import 'package:share_eat/daftar_pesanan_seller/page/daftar_pesanan_page.dart';
import 'package:share_eat/page/home_page.dart';
import 'package:share_eat/daftar_pesanan_seller/page/lihat_pesanan_page.dart';
import 'package:share_eat/page/homepage_customer.dart';
import 'package:share_eat/page/homepage_resto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Custom colors
  static Map<int, Color> themeColor = {
    50: const Color.fromRGBO(97, 118, 75, .1),
    100: const Color.fromRGBO(97, 118, 75, .2),
    200: const Color.fromRGBO(97, 118, 75, .3),
    300: const Color.fromRGBO(97, 118, 75, .4),
    400: const Color.fromRGBO(97, 118, 75, .5),
    500: const Color.fromRGBO(97, 118, 75, .6),
    600: const Color.fromRGBO(97, 118, 75, .7),
    700: const Color.fromRGBO(97, 118, 75, .8),
    800: const Color.fromRGBO(97, 118, 75, .9),
    900: const Color.fromRGBO(97, 118, 75, 1),
  };

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'ShareEat',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF61764B, themeColor),
        ),
        home: const HomePage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case HomePageCust.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomePageCust());
            case HomePageResto.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomePageResto());
            case DaftarPesananPage.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const DaftarPesananPage());
            case AddGratisanPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const AddGratisanPage());
            case LihatPesanan.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const LihatPesanan());
            case LoginPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return Scaffold(
                    body: SafeArea(
                      child: Center(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Oopss.. page yang kamu tuju tidak ada :(',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () => {Navigator.pop(context)},
                                child: const Text(
                                  "Kembali",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 72, 90, 53)),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 184, 204, 162),
                                  padding: const EdgeInsets.all(8.0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
