import 'dart:convert';

import 'package:blog_app/model/model.dart';
import "package:http/http.dart" as http;

const uri = 'https://jsonplaceholder.typicode.com/posts';

class PostServices {
  Future<List<Posts>> fetchPost() async {
    final response = await http
        .get(Uri.parse(uri), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body) as List;
      final post = jsonResponse.map((res) {
        return Posts(
          userId: res["userId"],
          id: res["id"],
          title: res["title"],
          body: res["body"],
        );
      }).toList();
      return post;
    } else {
      throw Exception("error occured");
    }
  }
}
