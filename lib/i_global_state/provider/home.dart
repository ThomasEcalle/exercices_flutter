import 'package:flutter/material.dart';
import 'package:flutter_lessons/i_global_state/provider/posts_model.dart';
import 'package:flutter_lessons/i_global_state/provider/selected_post_model.dart';
import 'package:provider/provider.dart';

import '../post.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Top(),
              flex: 1,
            ),
            Expanded(
              child: SelectedPost(),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  final Function(Post) onSelected;

  const Top({
    Key key,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Center(
        child: RaisedButton(
          color: Colors.white,
          child: Text("Click"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                final dialogSize = MediaQuery.of(context).size.width * .8;
                return Dialog(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: dialogSize,
                    width: dialogSize,
                    child: ChangeNotifierProvider<PostsModel>(
                      builder: (_) => PostsModel(),
                      child: Posts(
                        onClick: (_) => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SelectedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectedPostModel>(context);
    if (model.getSelectedPost() == null) {
      return Center(
        child: Text("Aucun post sélectionné"),
      );
    } else {
      final post = model.getSelectedPost();
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Titre :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      post.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Body :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    post.body,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

class Posts extends StatelessWidget {
  final Function(Post) onClick;

  Posts({
    Key key,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostsModel>(context);
    if (model.isLoading()) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final posts = model.getPosts();
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
            onTap: () {
              if (onClick != null) {
                onClick(posts[index]);
              }

              Provider.of<SelectedPostModel>(context).selectPost(posts[index]);
            },
          );
        },
      );
    }
  }
}
