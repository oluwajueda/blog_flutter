import 'dart:convert';

import 'package:blog_app/model/model.dart';
import "package:http/http.dart" as http;

const uri = 'https://jsonplaceholder.typicode.com/posts';

class PostServices {
  var jsonResponse = [];
  List<Posts> post = [];
  Future<List<Posts>> fetchPost({String? query}) async {
    try {
      final response = await http
          .get(Uri.parse(uri), headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        post = jsonResponse.map((res) => Posts.fromMap(res)).toList();

        if (query != null) {
          post = post
              .where(
                  (e) => e.title.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      } else {
        throw Exception("error occured");
      }
    } on Exception catch (e) {
      print("error: $e");
    }

    return post;
  }
}
