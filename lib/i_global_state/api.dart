import 'dart:convert';

import 'package:flutter_lessons/i_global_state/post.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String BASE_URL = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> getPost() async {
    final response = await http.get('$BASE_URL/posts');
    final jsonBody = json.decode(response.body);
    final List<Post> posts = [];
    posts.addAll((jsonBody as List).map((p) => Post.fromJson(p)).toList());

    return posts;
  }
}
