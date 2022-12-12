import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_eat/daftar_pesanan_seller/page/lihat_pesanan_page.dart';
import 'package:share_eat/widget/drawer_app.dart';

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
    final request = context.watch<CookieRequest>();
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
                    'Layani Pesananmu, Partner!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/chef-bg.jpg',
                  width: MediaQuery.of(context).size.width * 0.75,
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
                        if (request.loggedIn)
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddGratisanPage()),

                              // builder: (context) =>
                              //     const BuatMakananFormPage()),
                            )
                          }
                        else
                          {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(32.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomRight: Radius.circular(32.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 10.0),
                                  content: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          height: 8.0,
                                        ),
                                        const SizedBox(height: 30),
                                        const Center(
                                          child: Text(
                                            'Silahkan login terlebih dahulu!',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        InkWell(
                                          onTap: () => {
                                            Navigator.pop(context),
                                            setState(() {}),
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 20.0, bottom: 20.0),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF61764B),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(32.0),
                                                bottomRight:
                                                    Radius.circular(32.0),
                                              ),
                                            ),
                                            child: const Text(
                                              "BACK",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          }
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
                        if (request.loggedIn)
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const LihatPesanan()),
                            )
                          }
                        else
                          {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(32.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomRight: Radius.circular(32.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 10.0),
                                  content: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          height: 8.0,
                                        ),
                                        const SizedBox(height: 30),
                                        const Center(
                                          child: Text(
                                            'Silahkan login terlebih dahulu!',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        InkWell(
                                          onTap: () => {
                                            Navigator.pop(context),
                                            setState(() {}),
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 20.0, bottom: 20.0),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF61764B),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(32.0),
                                                bottomRight:
                                                    Radius.circular(32.0),
                                              ),
                                            ),
                                            child: const Text(
                                              "BACK",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          }
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
