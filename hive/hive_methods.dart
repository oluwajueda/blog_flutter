import 'package:blog_app/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveMethods {
  String hiveBox = "hive_local_db";

  addPost(Posts post) async {
    var box = await Hive.openBox(hiveBox);

    var mapPosts = post;

    await box.add(post);
  }
}
