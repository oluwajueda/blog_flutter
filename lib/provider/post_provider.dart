import 'package:blog_app/model/model.dart';
import 'package:blog_app/services/fetchPost_services.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<Posts> _posts = [];
  PostServices _postservices = PostServices();
  List<Posts> get posts => _posts;
  bool isLoading = false;
  Future<void> getAllPosts() async {
    isLoading = true;

    notifyListeners();
    final res = await _postservices.fetchPost();

    _posts = res;
    isLoading = false;
    notifyListeners();
  }
}
