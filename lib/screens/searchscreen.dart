import 'package:blog_app/provider/favouriteprovider.dart';
import 'package:blog_app/services/fetchPost_services.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
                              height: 260,
                              width: width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "${post?[i].title}",
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
                                        IconButton(
                                            onPressed: () {
                                              bookmark.favouritePost(post[i]);
                                            },
                                            icon: bookmark.isExist(post![i])
                                                ? Icon(Icons.bookmark)
                                                : Icon(Icons
                                                    .bookmark_outline_outlined))
                                      ],
                                    ),
                                    Text(
                                      post[i].body,
                                      textAlign: TextAlign.justify,
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
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Post"),
    );
  }
}
