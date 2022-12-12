import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_eat/daftar_pesanan_seller/fetch/fetch_pesanan.dart';
import 'package:share_eat/daftar_pesanan_seller/model/pesanan.dart';
import 'package:share_eat/daftar_pesanan_seller/page/daftar_pesanan_page.dart';
import 'package:share_eat/daftar_pesanan_seller/page/detail_pesanan_page.dart';
import 'package:share_eat/widget/drawer_app.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class LihatPesanan extends StatefulWidget {
  const LihatPesanan({super.key});
  static const ROUTE_NAME = '/lihat-pesanan';

  @override
  State<LihatPesanan> createState() => _LihatPesaananState();
}

// Color.fromARGB(255, 184, 204, 162)
// Color.fromARGB(255, 72, 90, 53)

Pesanan? pesanan;

class _LihatPesaananState extends State<LihatPesanan> {
  donePesanan(request, pk) async {
    final response = await request.post(
        'https://share-eat-d02.up.railway.app/daftar_pesanan_seller/done/flutter',
        // 'http://10.0.2.2:8000/daftar_pesanan_seller/done/flutter',
        {
          'pk': pk.toString(),
        });
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lihat Pesanan"),
      ),
      drawer: DrawerApp(LihatPesanan.ROUTE_NAME),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, DaftarPesananPage.ROUTE_NAME),
              child: const Text(
                "Kembali",
                style: TextStyle(color: Color.fromARGB(255, 72, 90, 53)),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 184, 204, 162),
                padding: const EdgeInsets.all(8.0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchPesanan(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    // print("GAK ADA");
                    return Center(
                      child: Column(
                        children: const [
                          Text(
                            "Tidak ada pesanan :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    );
                  } else {
                    // print("HERE");
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        // print("NAMA: " + item.fields.name);
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 2,
                            color: Color.fromARGB(255, 184, 204, 162),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      item.fields.name,
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFF61764B),
                                    height: 10.0,
                                    thickness: 1.3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          item.fields.description,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          item.fields.date
                                              .toString()
                                              .substring(0, 10),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                        // Text(
                                        //   item.pk.toString(),
                                        //   style: TextStyle(
                                        //       fontSize: 18,
                                        //       color: Colors.black),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFF61764B),
                                    height: 10.0,
                                    thickness: 1.3,
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () => {
                                          // pesanan = listPesanan
                                          //     .where((element) =>
                                          //         element.pk == item.pk)
                                          //     .elementAt(0),
                                          pesanan = item,
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPesananPage(
                                                        pesanan: pesanan)),
                                          )
                                        },
                                        child: const Text(
                                          "Lihat Detail",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xFF61764B),
                                          padding: const EdgeInsets.all(8.0),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fixedSize: Size(100, 5),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => {
                                          donePesanan(request, item.pk),
                                          // listPesanan.removeWhere((element) =>
                                          //     element.pk == item.pk),
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(32.0),
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    bottomRight:
                                                        Radius.circular(32.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 10.0),
                                                content: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      const SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      const Divider(
                                                        color: Colors.grey,
                                                        height: 8.0,
                                                      ),
                                                      const SizedBox(
                                                          height: 30),
                                                      const Center(
                                                        child: Text(
                                                          'Terimakasih sudah melayani pesanan!',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 50),
                                                      InkWell(
                                                        onTap: () => {
                                                          Navigator.pop(
                                                              context),
                                                          setState(() {}),
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20.0,
                                                                  bottom: 20.0),
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFF61764B),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      32.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          32.0),
                                                            ),
                                                          ),
                                                          child: const Text(
                                                            "BACK",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        },
                                        child: const Text(
                                          "Selesai",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xFF61764B),
                                          padding: const EdgeInsets.all(8.0),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fixedSize: Size(100, 5),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
