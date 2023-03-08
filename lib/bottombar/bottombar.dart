// ignore_for_file: prefer_const_constructors

import 'package:blog_app/screens/bookmarkscreen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const BookMarkScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline), label: "")
          ]),
    );
  }
}
