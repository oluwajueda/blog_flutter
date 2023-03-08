import 'package:blog_app/model/model.dart';

import 'package:blog_app/utils/UpperCaseWords.dart';
import 'package:blog_app/utils/capitalizeEachWord.dart';
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
    double width = MediaQuery.of(context).size.width;
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
                capitalizeWords(post.title),
                style: headerFont,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  formattedDate.toString(),
                  style: smallFont,
                ),
                Spacer(),
                Text(
                  "4 min read",
                  style: smallFont,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1.5,
              width: width * 0.95,
              color: faintBlackColor,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              post.body.toCapitalized(),
              style: bigtextFont,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
