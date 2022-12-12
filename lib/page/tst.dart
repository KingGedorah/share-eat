import 'package:share_eat/model/menu_model.dart';
import 'package:share_eat/page/menupage_detail.dart';
import 'package:flutter/material.dart';
import 'package:share_eat/fetch/menupage_fetch.dart';
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
                  return Text('${snapshot.data?[0].fields.name}');
                }
              }
            }));
  }
}

  
               
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (_, index) => Dismissible(
//                         key: Key(snapshot.data[index]),
//                         background: Container(
//                           alignment: AlignmentDirectional.centerEnd,
//                           color: Colors.red[300],
//                           child: const Icon(
//                             Icons.delete,
//                             color: Colors.white,
//                           ),
//                         ),
//                         // onDismissed: (direction) {
//                         //   setState(() {
//                         //     snapshot.data.removeAt(index);
//                         //   });
//                         // },
//                         direction: DismissDirection.endToStart,
//                         child: InkWell(
//                             // onTap: () {
//                             //   Navigator.push(
//                             //       context,
//                             //       MaterialPageRoute(
//                             //           builder: (context) => MenuDetail(
//                             //               detail: snapshot.data![index])));
//                             // },
//                             child: Card(
//                               elevation: 5,
//                               child: SizedBox(
//                                 height: 100.0,
//                                 child: Row(children: [
//                                   // Container(
//                                   //   height: 100.0,
//                                   //   width: 70.0,
//                                   //   decoration: BoxDecoration(
//                                   //       borderRadius: const BorderRadius.only(
//                                   //           bottomLeft: Radius.circular(5.0),
//                                   //           topLeft: Radius.circular(5.0)),
//                                   //       image: DecorationImage(
//                                   //           fit: BoxFit.cover,
//                                   //           image: NetworkImage('https://share-eat-d02.up.railway.app/static/${snapshot.data![index].fields.image}')),
//                                   // )),
//                                   SizedBox(
//                                     height: 100.0,
//                                     child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             10, 2, 0, 0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             const Text(
//                                                 'test'),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.fromLTRB(
//                                                       0, 3, 0, 3),
//                                               child: Container(
//                                                 width: 30,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                         color: const Color
//                                                                 .fromARGB(255,
//                                                             215, 133, 26))),
//                                                 child: const Text(
//                                                   'test',
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                   )
//                                 ]),
//                               ),
//                             ))),
//                   );
//                 }
//               }
//             }));
//   }
// }
