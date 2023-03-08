import 'package:blog_app/model/model.dart';
import 'package:blog_app/services/fetchPost_services.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/provider.dart';
import 'package:blog_app/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = PostServices().fetchPost();
  }

  String formattedDate = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    // bool bookmarked = false;

    // setBookMark() {
    //   setState(() {
    //     bookmarked = !bookmarked;
    //   });
    //   print("Hello");
    // }

    final bookmark = Provider.of<Favorite>(context);

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Blog",
            style: TextStyle(color: textColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
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
                                      post[i].title,
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
                                          icon: bookmark.isExist(post[i])
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
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }));
  }
}
