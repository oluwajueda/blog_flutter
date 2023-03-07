import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const HomeScreen(),
    );
  }
}
