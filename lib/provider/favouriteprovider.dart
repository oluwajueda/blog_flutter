import 'package:blog_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorite extends ChangeNotifier {
  List<Posts> _favorite = [];

  List<Posts> get favourite => _favorite;

  void favouritePost(Posts post) {
    final isContain = _favorite.contains(post);

    if (isContain) {
      _favorite.remove(post);
    } else {
      _favorite.add(post);
    }

    notifyListeners();
  }

  bool isExist(Posts post) {
    final isContain = _favorite.contains(post);

    return isContain;
  }

  void clearFavoritePost() {
    _favorite = [];

    notifyListeners();
  }
}
