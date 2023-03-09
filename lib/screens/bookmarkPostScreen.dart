import 'package:blog_app/provider/favouriteprovider.dart';
import 'package:blog_app/screens/PostDetailsScreen.dart';
import 'package:blog_app/services/shared_prefs.dart';
import 'package:blog_app/utils/capitalizeEachWord.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class BookMarkPostScreen extends StatefulWidget {
  const BookMarkPostScreen({super.key});

  @override
  State<BookMarkPostScreen> createState() => _BookMarkPostScreenState();
}

class _BookMarkPostScreenState extends State<BookMarkPostScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future getBook() {
    return BookmarkServices()
        .getPostsFromSharedPreferences("savedPost")
        .then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
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
        body: FutureBuilder(
            future: getBook(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your bookmarked posts will be found here.",
                      style: bigtextFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int i) {
                            var post = snapshot.data[i];
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: whiteBackground,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9)),
                                  ),
                                  height: 300,
                                  width: width * 0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            capitalizeWords(post.title),
                                            style: headerFont,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: ClipOval(
                                                    child: Image.asset(
                                                        "assets/images/randomPicture.jpg")),
                                              ),
                                            ),
                                            Text(formattedDate.toString(),
                                                style: smallFont),
                                            IconButton(
                                                color: faintBlackColor,
                                                onPressed: () async {
                                                  await BookmarkServices()
                                                      .clearPostAtIndex(
                                                          i, "savedPost");

                                                  var futurePost =
                                                      BookmarkServices()
                                                          .getPostsFromSharedPreferences(
                                                              "savePost");

                                                  setState(() {
                                                    post = futurePost;
                                                  });

                                                  showSnacBar(context,
                                                      "Bookmarked Post Deleted");
                                                },
                                                icon: Icon(Icons.delete)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 1.5,
                                          width: width * 0.9,
                                          color: faintBlackColor,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          post.body,
                                          textAlign: TextAlign.justify,
                                          style: textFont,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: width * 0.9,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                buttonColor,
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  whiteBackground,
                                                            )),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PostDetailsScreen(
                                                                      post: post[
                                                                          i])));
                                                    },
                                                    child: const Text(
                                                      "Read more",
                                                    )),
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
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(
                  child: SizedBox(
                height: 60,
                width: 60,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(buttonColor),
                ),
              ));
            }));
  }
}
