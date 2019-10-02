import 'package:flutter/material.dart';
import 'package:flutter_lessons/i_global_state/api.dart';
import 'package:flutter_lessons/i_global_state/post.dart';

class PostsModel with ChangeNotifier {
  List<Post> _posts = [];
  bool _loading = false;

  PostsModel() {
    fetchPosts();
  }

  bool isLoading() => _loading;

  List<Post> getPosts() => _posts;

  Future<void> fetchPosts() async {
    _loading = true;
    notifyListeners();
    _posts = await Api.getPost();
    _loading = false;
    notifyListeners();
  }
}
