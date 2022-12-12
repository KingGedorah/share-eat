import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:share_eat/main.dart';
import 'package:share_eat/seller_menu/model/makanan.dart';
import 'package:share_eat/seller_menu/page/page_makanan.dart';
import 'package:share_eat/widget/drawer_app.dart';

class EditMakananFormPage extends StatefulWidget {
  final Makanan makanan;
  const EditMakananFormPage({super.key, required this.makanan});

  static const ROUTE_NAME = "/edit-makanan-form";
  @override
  State<EditMakananFormPage> createState() => _EditMakananPageState();
}

class _Makanan {
  String name = "";
  String description = "";
  int harga = 0;
  int stok = 0;
  _Makanan(this.name, this.description, this.harga, this.stok);
}

class _EditMakananPageState extends State<EditMakananFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaMakanan = "";
  int _harga = 0;
  String _deskripsi = "";
  int _stok = 0;
  String _tempStok = "";
  String _tempHarga = "";

  void initState() {
    _namaMakanan = widget.makanan.fields.name;
    _tempHarga = widget.makanan.fields.harga.toString();
    _deskripsi = widget.makanan.fields.description;
    _tempStok = widget.makanan.fields.stok.toString();
  }

  updateMakanan(request, makanan) async {
    final response = await request.post(
        'https://share-eat-d02.up.railway.app/seller_menu/update/makanan/${widget.makanan.pk}',
        {
          'food_name': makanan.name,
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit Makanan'),
      ),
      drawer: DrawerApp(EditMakananFormPage.ROUTE_NAME),
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
                        initialValue: widget.makanan.fields.name,
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
                        initialValue: widget.makanan.fields.harga.toString(),
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
                            _tempHarga = value!;
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
                        initialValue: widget.makanan.fields.description,
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
                        initialValue: widget.makanan.fields.stok.toString(),
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
                            _tempStok = value!;
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
                  "Update Makanan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _harga = int.parse(_tempHarga);
                    _stok = int.parse(_tempStok);
                    final _makanan =
                        new _Makanan(_namaMakanan, _deskripsi, _harga, _stok);
                    updateMakanan(request, _makanan);
                    // final _budget =
                    //     new Budget(_judul, _harga, jenisBudget, selectDate);
                    // MyFormPage.budgetList.add(_budget);
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
