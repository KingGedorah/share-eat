import 'package:customer_page/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:customer_page/models/menu_model.dart';


class MenuDetail extends StatelessWidget {
  const MenuDetail({super.key, required this.detail});

  final MenuPage detail;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text(detail.fields.name),
          centerTitle: true,
      ),
    );
  }
  
}

