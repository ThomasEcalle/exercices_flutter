import 'package:flutter/material.dart';
import 'package:flutter_lessons/i_global_state/api.dart';

import '../post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Post _selectedPost;

  _selectPost(Post post) {
    setState(() {
      _selectedPost = post;
    });
    // May have API calls logic here -> bad practice
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Top(
                onSelected: _selectPost,
              ),
              flex: 1,
            ),
            Expanded(
              child: SelectedPost(
                post: _selectedPost,
              ),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}

class SelectedPost extends StatelessWidget {
  final Post post;

  const SelectedPost({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post == null) {
      return Center(
        child: Text("Aucun post sélectionné"),
      );
    } else {
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
                    child: Posts(
                      onSelected: (Post post) {
                        if (onSelected != null) {
                          onSelected(post);
                        }
                        Navigator.of(context).pop();
                      },
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

class Posts extends StatelessWidget {
  final Function(Post) onSelected;

  const Posts({
    Key key,
    @required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getPost(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          final posts = snapshot.data;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
                onTap: () => this.onSelected != null
                    ? this.onSelected(posts[index])
                    : print("Aucune callback"),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
