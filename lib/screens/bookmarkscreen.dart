import 'package:blog_app/model/model.dart';
import 'package:blog_app/screens/PostDetailsScreen.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/provider/favouriteprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<Favorite>(context);
    final favorites = favorite.favourite;

    double width = MediaQuery.of(context).size.width;
    String formattedDate = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent Bookmarks",
          style: navText,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int i) {
            final favourite = favorites[i];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: whiteBackground,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  height: 260,
                  width: width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(favourite.title, style: headerFont),
                        ),
                        Row(
                          children: [
                            Text(
                              formattedDate.toString(),
                              style: smallFont,
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: faintBlackColor,
                                ))
                          ],
                        ),
                        Text(
                          favourite.body,
                          textAlign: TextAlign.justify,
                          style: textFont,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width * 0.9,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: buttonColor,
                                        textStyle: TextStyle(
                                          color: whiteBackground,
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PostDetailsScreen(
                                                      post: favourite)));
                                    },
                                    child: const Text("Read more")),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            );
          }),
    );
  }
}
