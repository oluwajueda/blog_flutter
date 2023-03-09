import 'dart:convert';

import 'package:blog_app/model/model.dart';
import 'package:blog_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

const uri = 'https://jsonplaceholder.typicode.com/posts';

class PostServices {
  var jsonResponse = [];
  List<Posts> post = [];
  Future<List<Posts>> fetchPost(
      {required BuildContext context, String? query}) async {
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
      }
      if (response.statusCode == 400) {
        showSnacBar(context, "bad request");
      }
      if (response.statusCode == 500) {
        showSnacBar(context, "can not load data");
      }
    } on Exception catch (e) {
      showSnacBar(context, "${e.toString()}, connect to internet");
    }

    return post;
  }
}
