import 'package:flutter/material.dart';

/// Create a layout like :
/// A list of data
/// Talsk about :
/// * ListViews
/// * ListTile

void main() => runApp(Solution());

class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class App extends StatelessWidget {
  final List<Post> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return PostItem(post: _items[index]);
          },
        ),
      ),
    ));
  }
}

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.body),
      leading: Icon(Icons.title),
    );
  }
}
