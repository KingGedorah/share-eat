import 'package:customer_page/screens/menu/tst.dart';
import 'package:flutter/material.dart';
// import 'package:customer_page/pages/drawer.dart';
import 'package:customer_page/fetch/restaurantpage_fetch.dart';
import 'package:share_eat/drawer.dart';

class MyRestaurantPage extends StatefulWidget {
  const MyRestaurantPage({super.key});

  @override
  State<MyRestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<MyRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                color: Colors.white,
                Icons.shopping_cart
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyRestaurantPage())
                  );
                },
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
            future: fetchRestaurantPage(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Restoran tidak tersedia",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            leading: const Icon(Icons.restaurant_outlined),
                            title: Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text(
                                "Alamat: ${snapshot.data![index].fields.alamat}\nNo.Telp: ${snapshot.data![index].fields.noTelp}"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyMenuPage()),
                              );
                            },
                          )));
                }
              }
            }));
  }
}
