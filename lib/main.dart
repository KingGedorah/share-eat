import 'package:flutter/material.dart';
import 'package:share_eat/daftar_pesanan_page.dart';
import 'package:share_eat/homepage.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF61764B, themeColor),
      ),
      home: const HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case DaftarPesananPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => const DaftarPesananPage());
          default:
            return MaterialPageRoute(
              builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Column(
                      children: [
                        Center(
                          child: Text('Page yang kamu tuju tidak ada.'),
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
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
