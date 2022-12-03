import 'package:flutter/material.dart';
// import 'package:customer_page/pages/drawer.dart';
import 'package:customer_page/fetch/restaurantpage_fetch.dart';
import 'package:customer_page/screens/menu/menu_page.dart';

class myRestaurantPage extends StatefulWidget {
  const myRestaurantPage({super.key});

  @override
  State<myRestaurantPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<myRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant'),
        ),
        // drawer: const MyDrawer(),
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
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                            border: Border.all(
                              width: 2,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.restaurant_outlined),
                            title: Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            subtitle: Text(
                              "alamat: ${snapshot.data![index].fields.alamat}\nNo.Telp: ${snapshot.data![index].fields.noTelp}"
                            )
                            
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyWatchListDetail(
                            //             mwl: snapshot.data![index])),
                            //   );
                            // },
                          )));
                }
              }
            }));
  }
}