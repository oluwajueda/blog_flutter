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
        title: const Text(
          "Blog",
          style: TextStyle(color: textColor),
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
                          child: Text(
                            favourite.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(formattedDate.toString()),
                            Spacer(),
                            // IconButton(
                            //     onPressed: () {
                            //       bookmark.favouritePost(post[i]);
                            //     },
                            //     icon: bookmark.isExist(post[i])
                            //         ? Icon(Icons.bookmark)
                            //         : Icon(Icons.bookmark_outline_outlined)

                            //         )
                          ],
                        ),
                        Text(
                          favourite.body,
                          textAlign: TextAlign.justify,
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
                                    onPressed: () {},
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
                  height: 20,
                ),
              ],
            );
          }),
    );
  }
}
