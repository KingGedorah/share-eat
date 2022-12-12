import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:share_eat/drawer/drawer.dart';
import 'package:share_eat/main.dart';
import 'package:share_eat/page_makanan.dart';

class BuatMakananFormPage extends StatefulWidget {
  const BuatMakananFormPage({super.key});

  @override
  State<BuatMakananFormPage> createState() => _BuatMakananPageState();
}

class _Makanan {
  String name = "";
  String description = "";
  int harga = 0;
  int stok = 0;
  _Makanan(this.name, this.description, this.harga, this.stok);
}

class _BuatMakananPageState extends State<BuatMakananFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaMakanan = "";
  int _harga = 0;
  String _deskripsi = "";
  int _stok = 0;

  buatMakanan(request, makanan) async {
    final response = await request.post(
        'https://share-eat-d02.up.railway.app/seller_menu/add/makanan/flutter',
        {
          'name': makanan.name,
          'description': makanan.description,
          'harga': makanan.harga.toString(),
          'stok': makanan.stok.toString(),
        });
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MakananPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Makanan'),
      ),
      drawer: DrawerWidget(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nama makanan",

                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _namaMakanan = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _namaMakanan = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama makanan tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Harga",

                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _harga = int.parse(value!);
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _harga = int.parse(value!);
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Harga tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Deskripsi",

                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _deskripsi = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _deskripsi = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Deskripsi tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Stok",

                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _stok = int.parse(value!);
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _stok = int.parse(value!);
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Stok tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: const Text(
                  "Tambah Makanan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final _makanan =
                        new _Makanan(_namaMakanan, _deskripsi, _harga, _stok);
                    buatMakanan(request, _makanan);
                    // final _budget =
                    //     new Budget(_judul, _harga, jenisBudget, selectDate);
                    // MyFormPage.budgetList.add(_budget);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
