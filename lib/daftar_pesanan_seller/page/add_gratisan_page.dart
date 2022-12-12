import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_eat/daftar_pesanan_seller/model/pesanan.dart';
import 'package:share_eat/daftar_pesanan_seller/page/daftar_pesanan_page.dart';
import 'package:share_eat/widget/drawer_app.dart';

class AddGratisanPage extends StatefulWidget {
  const AddGratisanPage({super.key});
  static const ROUTE_NAME = "/add-gratisan";

  @override
  State<AddGratisanPage> createState() => _AddGratisanPageState();
}

class _Pesanan {
  final String name;
  final String description;
  _Pesanan(this.name, this.description);
}

class _AddGratisanPageState extends State<AddGratisanPage> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? customer;

  addGratisan(request, pesanan) async {
    // print("NAME " + name!);
    // print("CUST " + customer!);
    // print(pesanan!.name);
    try {
      final response = await request.post(
          'https://share-eat-d02.up.railway.app/daftar_pesanan_seller/add/flutter',
          // 'http://10.0.2.2:8000/daftar_pesanan_seller/add/flutter',
          {
            'name': name,
            'description': customer,
          });
    } catch (e) {
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
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      'Makanan yang ditambahkan tidak ada!',
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
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF61764B),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0),
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
      );
      return;
    }
    // print(response.toString());
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DaftarPesananPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // print(request.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Gratisan"),
      ),
      drawer: DrawerApp(AddGratisanPage.ROUTE_NAME),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Makanan",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              name = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              name = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama makanan tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Customer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              customer = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              customer = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama makanan tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: const Text(
                    "Add Gratisan",
                    style: TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 184, 204, 162),
                    padding: const EdgeInsets.all(8.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 40),
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final pesanan = new _Pesanan(name!, customer!);
                      // print("MASUK BUTTON");
                      addGratisan(request, pesanan);
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return Dialog(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       elevation: 15,
                      //       child: Container(
                      //         child: ListView(
                      //           padding:
                      //               const EdgeInsets.only(top: 20, bottom: 20),
                      //           shrinkWrap: true,
                      //           children: <Widget>[
                      //             Center(
                      //               child:
                      //                   const Text('Berhasil Menambahkan Data'),
                      //             ),
                      //             SizedBox(height: 20),
                      //             TextButton(
                      //               onPressed: () {
                      //                 // dynamic pesanan =
                      //                 //     new _Pesanan(name!, customer!);

                      //                 // addGratisan(request, pesanan);
                      //               },
                      //               child: Text('Kembali'),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );

                      // Pesanan.idCounter = <punya_web>;
                      // listPesanan.add(
                      //   Pesanan(
                      //     model: "daftar_pesanan_seller.pesanan",
                      //     pk: ++Pesanan.idCounter,
                      //     fields: new Fields(
                      //       seller: 4,
                      //       date: DateTime.now(),
                      //       name: name!,
                      //       description: customer!,
                      //       makanan: 2,
                      //     ),
                      //   ),
                      // );
                      // <pubya_web>> = Pesanan.idCounter;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
