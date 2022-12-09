import 'package:flutter/material.dart';
// import 'package:customer_page/pages/drawer.dart';
import 'package:customer_page/fetch/menupage_fetch.dart';
//import 'package:customer_page/fetch/restaurantpage_fetch.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({super.key});

  @override
  State<MyMenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MyMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
        ),
        // drawer: const MyDrawer(),
        body: FutureBuilder(
            future: fetchMenuPage(),
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
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/${snapshot.data[index].image}')))),
                        Container(
                          height: 100,
                          width: 200,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0)
                                  ),
                                  color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 1.0, bottom: 1.0),
                                    child: Column(
                                      children: const [
                                        Text('test')
                                      ],)),
                        )
                      ]),
                    ),
                  );
                }
              }
            }));
  }
}
