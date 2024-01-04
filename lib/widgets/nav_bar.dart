import 'package:flutter/material.dart';
import 'package:movies_app/mylists/my_list_page.dart';
import 'package:movies_app/search/search_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        iconSize: 28,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.id);
                },
                child: const Icon(Icons.search)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyListPage.id);
                },
                child: Icon(Icons.list)),
            label: 'my list',
          ),
        ]);
  }
}
