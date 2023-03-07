import 'package:blog_app/model/model.dart';
import 'package:blog_app/services/fetchPost_services.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

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
                            decoration: BoxDecoration(color: whiteBackground),
                            height: 300,
                            width: width * 0.9,
                            child: Column(
                              children: [
                                Text(post[i].title),
                                Row(
                                  children: [
                                    Text(post[i].userId.toString()),
                                    Text(formattedDate.toString())
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
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
