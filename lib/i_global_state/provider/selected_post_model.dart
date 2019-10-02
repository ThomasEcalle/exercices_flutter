import 'package:flutter/material.dart';

import '../post.dart';

class SelectedPostModel with ChangeNotifier {
  Post _selectedPost;

  Post getSelectedPost() => _selectedPost;

  selectPost(Post post) {
    _selectedPost = post;
    notifyListeners();
  }
}
