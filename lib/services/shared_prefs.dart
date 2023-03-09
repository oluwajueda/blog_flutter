import 'package:blog_app/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkServices {
  // Future<void> savePostsToSharedPreferences(
  //     List<Posts> posts, String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var listToSave = posts.map((e) => e.toJson()).toList();
  //   await prefs.setStringList(key, listToSave);
  // }
  Future<void> savePostsToSharedPreferences(String key, Posts post) async {
    final prefs = await SharedPreferences.getInstance();
    var listToSave = prefs.getStringList(key) ?? [];
    listToSave.add(post.toJson());
    await prefs.setStringList(key, listToSave);
  }
  // Future<List<Posts>> getPostsFromSharedPreferences(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var listToGet = prefs.getStringList(key);
  //   if (listToGet == null) {
  //     return [];
  //   }
  //   return listToGet.map((e) => Posts.fromJson(e)).toList();
  // }

  Future<List<Posts>> getPostsFromSharedPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var listToGet = prefs.getStringList(key);
    if (listToGet != null) {
      return listToGet.map((e) => Posts.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<void> clearSharedPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }

  Future<void> clearPostAtIndex(int index, String key) async {
    final prefs = await SharedPreferences.getInstance();
    var listToSave = prefs.getStringList(key);
    if (listToSave != null) {
      listToSave.removeAt(index);
      await prefs.setStringList(key, listToSave);
    }
  }
}
