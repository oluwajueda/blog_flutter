import 'package:blog_app/model/model.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({super.key, required this.post});

  final Posts post;
  String formattedDate = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                post.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  formattedDate.toString(),
                  style: TextStyle(color: faintBlackColor),
                ),
                Spacer(),
                Text(
                  "4 min read",
                  style: TextStyle(color: faintBlackColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
