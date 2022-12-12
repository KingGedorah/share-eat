import 'package:flutter/material.dart';
import 'package:share_eat/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_eat/page/cart_page.dart';
import 'package:share_eat/widget/drawer_cust.dart';
import 'package:share_eat/main.dart';

class BuatCatatanFormPage extends StatefulWidget {
  const BuatCatatanFormPage({super.key});
  static const ROUTE_NAME = 'route';

  @override
  State<BuatCatatanFormPage> createState() => _BuatCatatanFormPageState();
}

class _Catatan {
  String catatanPesanan = "";
  _Catatan(this.catatanPesanan);
}

class _BuatCatatanFormPageState extends State<BuatCatatanFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _catatan = "";

  buatCatatan(request, catatan, context) async {
    final response = await request.post('https://share-eat-d02.up.railway.app/fitur_keranjang/add_catatan/', {
    'catatanPesanan' : catatan.catatanPesanan.toString(),
    });
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const UserCartPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan'),
      ),
      drawer: DrawerCust(BuatCatatanFormPage.ROUTE_NAME),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                  Padding(padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Catatan Pesanan",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _catatan = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _catatan = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Catatan tidak boleh kosong';
                        }
                      },
                    )   
                  ),                
                  ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: const Text(
                  "Tambah Catatan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final _catatanUser = new _Catatan(_catatan);
                    buatCatatan(request, _catatanUser, context);
                  }
                },
              ),)
          ]),
      ),
    );
  }
}
