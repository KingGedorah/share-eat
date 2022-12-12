import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_eat/drawer/drawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  String username1 = "";
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  login(request) async {
    // final request = context.read<CookieRequest>();
    final response = await request.login(
        "https://share-eat-d02.up.railway.app/loginpage/login/restaurant/flutter",
        {
          'username': username,
          'password': password1,
        });
    // final response = await request
    //     .login("http://127.0.0.1:8000/loginpage/login/restaurant/flutter", {
    //   'username': username,
    //   'password': password1,
    // });
    if (request.loggedIn) {
      Text("Hello");
      print("worked");
      print(request.cookies);
      print(request.headers);
      print(response["user"]);
      print(username1);
      // final test = json.decode(response);
      // print(test);
      // final response1 =
      //     await request.post("http://127.0.0.1:8000/todolist/add/", {
      //   'user': response["user"],
      //   'title': "MonkAGIA",
      //   'description': "HELLOAWAWA",
      // });
      // Code here will run if the login succeeded.
    } else {
      print("not worked");
      // Code here will run if the login failed (wrong username/password).
    }
    // print(response.body);
    // return response.body;
  }

  String username = "";
  String password1 = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Budget'),
        ),
        drawer: DrawerWidget(),
        body: Form(
            key: _loginFormKey,
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul",

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
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
                      hintText: "Nominal",

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul1 tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        login(request);
                        // final response =
                        //     request.login("http://127.0.0.1:8000/auth/login/", {
                        //   'username': "jasonirvine76",
                        //   'password': "112233Irvine",
                        // });
                        // if (request.loggedIn) {
                        //   Text("Hello");
                        //   print("worked");

                        //   print(username1);
                        //   final response1 = request
                        //       .post("http://127.0.0.1:8000/todolist/add/", {
                        //     'user': "jasonirvine76",
                        //     'title': "MonkAGIA",
                        //     'description': "HELLOAWAWA",
                        //   });
                        // } else {
                        //   // Code here will run if the login failed (wrong username/password).
                        // }
                        // print(response.body);
                        // return response.body;
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}
