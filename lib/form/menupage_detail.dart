import 'package:flutter/services.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_eat/model/menu_model.dart';
import 'package:flutter/material.dart';

import '../restaurant_page.dart';

//import 'package:share_eat/model/menu_model.dart';

class MenuDetail extends StatefulWidget {
  const MenuDetail({super.key, required this.detail});

  final MenuPage detail;

  @override
  State<MenuDetail> createState() => _MyFormCart();
}

class _Cart {
  int item = 0;
  _Cart(this.item);
}

class _MyFormCart extends State<MenuDetail> {
  final _formKey = GlobalKey<FormState>();
  final _controllerJumlah = TextEditingController();

  int jumlahitem = 0;

  addtoCart(request, cart_item) async {
    final response = await request.post(
        'https://share-eat-d02.up.railway.app/order-page_for_cust/json-flutter/',
        {
          'add_cart': cart_item.item.toString(),
          'id': widget.detail.pk.toString()
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(color: Colors.white, Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyRestaurantPage()));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //     height: 300.0,
                        //     width: MediaQuery.of(context).size.width,
                        //     decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: NetworkImage(
                        //             'https://share-eat-d02.up.railway.app/static/${widget.detail.fields.image}'),
                        //       ),
                        //     )),
                        const SizedBox(height: 15),
                        Text(
                          widget.detail.fields.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Rp.${widget.detail.fields.harga}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.detail.fields.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: [
                            TextFormField(
                              controller: _controllerJumlah,
                              decoration: InputDecoration(
                                  labelText: "Mau beli berapa?",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  jumlahitem = int.parse(value!);
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  jumlahitem = int.parse(value!);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Kamu belum isi mau beli berapa:(';
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        // const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(jumlahitem);
                                final _cart = new _Cart(jumlahitem);
                                addtoCart(request, _cart);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: [
                                            const Center(
                                                child: Text(
                                              'Pesanan berhasil ditambahkan!',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            const SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _controllerJumlah.clear();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Oke'),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              }
                            },
                            child: const Text(
                              "Beli",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
