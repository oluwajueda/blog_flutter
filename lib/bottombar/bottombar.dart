// ignore_for_file: prefer_const_constructors

import 'package:blog_app/screens/bookmarkscreen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/searchscreen.dart';
import 'package:blog_app/utils/colors.dart';
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _page,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _page == 0
                        ? Icon(
                            Icons.home,
                            color: buttonColor,
                          )
                        : Icon(
                            Icons.home_outlined,
                            color: buttonColor,
                          ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _page == 1
                        ? Icon(
                            Icons.search_rounded,
                            color: buttonColor,
                          )
                        : Icon(
                            Icons.search_outlined,
                            color: buttonColor,
                          ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _page == 2
                        ? Icon(
                            Icons.bookmark,
                            color: buttonColor,
                          )
                        : Icon(
                            Icons.bookmark_outline,
                            color: buttonColor,
                          ),
                  ),
                  label: "")
            ],
            onTap: updatePage,
          ),
        ),
      ),
    );
  }
}
