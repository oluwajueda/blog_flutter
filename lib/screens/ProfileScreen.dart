import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: navText,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/profile_blog.png"),
            SizedBox(
              height: 15,
            ),
            Text(
              "Name: Olamide Osuolale ",
              style: profileFont,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Job Description: Fullstack Engineer",
              style: profileFont,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Thank you for shortlisting me",
              style: shortlistFont,
            )
          ],
        ),
      ),
    );
  }
}
