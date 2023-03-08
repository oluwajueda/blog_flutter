import 'package:blog_app/model/model.dart';
import 'package:flutter/material.dart';

class Favorite extends ChangeNotifier {
  List<Posts> _favorite = [];

  List<Posts> get favourite => _favorite;

  void favouritePost(Posts post) {
    final isContain = _favorite.contains(post);

    if (isContain) {
      return;
    } else {
      _favorite.add(post);
    }

    notifyListeners();
  }

  void clearFavoritePost() {
    _favorite = [];

    notifyListeners();
  }
}
