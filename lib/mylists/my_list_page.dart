import 'package:flutter/material.dart';
import 'package:movies_app/mylists/item_list.dart';
import 'package:movies_app/widgets/custom_text.dart';

class MyListPage extends StatelessWidget {
  static String id = 'CartPage';

  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: const CustomText(text: 'MyList', size: 22, color: Colors.red)),
      body: const FavoriteList(),
    );
  }
}
