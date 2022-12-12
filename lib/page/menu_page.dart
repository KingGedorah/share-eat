import 'package:share_eat/model/menu_model.dart';
import 'package:share_eat/model/restaurant_model.dart';
import 'package:share_eat/form/menupage_detail.dart';
import 'package:flutter/material.dart';
import 'package:share_eat/fetch/menupage_fetch.dart';
import 'package:share_eat/page/cart_page.dart';
import '../restaurant_page.dart';


//import 'package:customer_page/models/menu_model.dart';
// import 'package:customer_page/models/restaurant_model.dart';

class MyMenuPage extends StatefulWidget {
  final int idresto;
  const MyMenuPage({super.key, required this.idresto});

  @override
  State<MyMenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MyMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
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
                        builder: (context) => const UserCartPage()));
              },
            )
          ],
        ),
        body: FutureBuilder(
            future: fetchMenuPage(widget.idresto),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Menu tidak tersedia",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  //return Text('${snapshot.data?[0].fields.name}');
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => SingleChildScrollView(child:Card(
                              child: ListTile(
                            title: Text('${snapshot.data![index].fields.name}'),
                            subtitle: Text('Rp ${snapshot.data![index].fields.harga}'),
                            leading: const Icon(Icons.restaurant),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: ((context) => MenuDetail(detail: snapshot.data![index])
                              )));
                            },
                          ))));
                }
              }
            }));
  }
}

  
               

