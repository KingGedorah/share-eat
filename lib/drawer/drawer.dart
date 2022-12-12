import 'package:flutter/material.dart';
import 'package:share_eat/form/buat_makanan.dart';
import 'package:share_eat/main.dart';
import 'package:share_eat/login.dart';
import 'package:share_eat/page_makanan.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "Tes")),
              );
            },
          ),
          ListTile(
            title: const Text('Auth'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Seller Page'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MakananPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Makanan'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BuatMakananFormPage()),
              );
            },
          ),
        ],
      ),
    );

    //   body: Center(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 50,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}


// import 'package:flutter/material.dart';
// import 'package:share_eat/form/buat_makanan.dart';
// import 'package:share_eat/main.dart';
// import 'package:share_eat/login.dart';
// import 'package:share_eat/register.dart';
// import 'package:share_eat/page_makanan.dart';
// import 'package:share_eat/restaurant_page.dart';
// import '../page/profile_page_customer.dart';
// import '../page/profile_page_seller.dart';

// class DrawerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           // Menambahkan clickable menu
//           ListTile(
//             title: const Text('counter_7'),
//             onTap: () {
//               // Route menu ke halaman utama
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const MyHomePage(title: "Tes")),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Login Page'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Register Page'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const RegisterPage()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Profile Page (Seller)'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const ProfilePageSeller()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Profile Page (Customer)'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const ProfilePageCustomer()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Seller Page'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MakananPage()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Tambah Makanan'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const BuatMakananFormPage()),
//               );
//             },
//           ),
//         ],
//       ),
//     );

//     //   body: Center(
//     //     child: Column(
//     //       children: [
//     //         SizedBox(
//     //           height: 50,
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }

// class MyDrawer extends StatefulWidget {
//   const MyDrawer({super.key});

//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(children: [
//         ListTile(
//           title: const Text('Restaurant'),
//           onTap: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const MyRestaurantPage()));
//           },
//         )
//       ]),
//     );
//   }
// }
