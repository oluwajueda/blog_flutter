import 'package:blog_app/provider/favouriteprovider.dart';
import 'package:blog_app/screens/PostDetailsScreen.dart';
import 'package:blog_app/services/fetchPost_services.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/utils/capitalizeEachWord.dart';

class SearchPost extends SearchDelegate {
  PostServices _postService = PostServices();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final bookmark = Provider.of<Favorite>(context);

    double width = MediaQuery.of(context).size.width;
    String formattedDate = DateFormat.yMd().format(DateTime.now());
    return FutureBuilder(
        future: _postService.fetchPost(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int i) {
                        var post = snapshot.data;
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
                                        capitalizeWords(post![i].title),
                                        style: headerFont,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: ClipOval(
                                                child: Image.asset(
                                                    "assets/images/randomPicture.jpg")),
                                          ),
                                        ),
                                        Text(
                                          formattedDate.toString(),
                                          style: smallFont,
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              bookmark.favouritePost(post[i]);
                                            },
                                            icon: bookmark.isExist(post[i])
                                                ? Icon(
                                                    Icons.bookmark,
                                                    color: faintBlackColor,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .bookmark_outline_outlined,
                                                    color: faintBlackColor,
                                                  ))
                                      ],
                                    ),
                                    Container(
                                      height: 1.5,
                                      width: width * 0.9,
                                      color: faintBlackColor,
                                    ),
                                    Text(
                                      post[i].body,
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
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        buttonColor,
                                                    textStyle: TextStyle(
                                                      color: whiteBackground,
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
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(buttonColor),
                  )));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Post"),
    );
  }
}
