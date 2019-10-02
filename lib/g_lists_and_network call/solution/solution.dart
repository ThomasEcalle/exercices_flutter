import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'post.dart';

/// Create a layout like :
/// A list of data from network : https://jsonplaceholder.typicode.com/posts
/// Talk about :
/// * Futures
/// * Make an async call with http
/// * Using initState
/// * Using FutureBuilder

void main() => runApp(Solution());

class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  Future<List<Post>> _getItems() async {
    final response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Post> posts = [];
    posts.addAll((jsonBody as List).map((post) => Post.fromJson(post)).toList());

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: _getItems(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("error"),
              );
            }
            if (snapshot.hasData) {
              final posts = snapshot.data;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostItem(post: posts[index]);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ));
  }
}

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.body),
      leading: Icon(Icons.title),
    );
  }
}
