import 'package:blog_app/model/model.dart';
import 'package:blog_app/screens/PostDetailsScreen.dart';
import 'package:blog_app/screens/searchscreen.dart';
import 'package:blog_app/services/fetchPost_services.dart';
import 'package:blog_app/utils/capitalizeEachWord.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/provider/favouriteprovider.dart';
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
    futurePost = PostServices().fetchPost(context: context);
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
          title: Text(
            "Krystal Digital",
            style: navText,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchPost());
                },
                icon: Icon(
                  Icons.search_sharp,
                  color: buttonColor,
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
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
                                  height: 300,
                                  width: width * 0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            capitalizeWords(post[i].title),
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
                                                onPressed: () {
                                                  bookmark
                                                      .favouritePost(post[i]);
                                                  print(post[i]);
                                                },
                                                icon: bookmark.isExist(post[i])
                                                    ? Icon(Icons.bookmark)
                                                    : Icon(Icons
                                                        .bookmark_outline_outlined)),
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
