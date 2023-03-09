import 'package:blog_app/bottombar/bottombar.dart';
import 'package:blog_app/provider/post_provider.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/provider/favouriteprovider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox("bookmark");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Favorite()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const BottomBar(),
    );
  }
}
