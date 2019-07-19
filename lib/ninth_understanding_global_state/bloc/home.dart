import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_event.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_state.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_event.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_state.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/post.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Top(),
              flex: 2,
            ),
            Expanded(
              child: SelectedPost(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedPostEvent, SelectedPostState>(
        bloc: BlocProvider.of<SelectedPostBloc>(context),
        builder: (BuildContext context, SelectedPostState state) {
          if (state is PostsSelected) {
            final post = state.post;
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Titre du post sélectionné !",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text("Aucun post sélectionné"),
            );
          }
        });
  }
}

class Top extends StatelessWidget {
  final Function(Post) onSelected;

  const Top({Key key, this.onSelected}) : super(key: key);

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
                    child: BlocProvider(
                      builder: (BuildContext context) => PostBloc(),
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

class Posts extends StatelessWidget {
  Completer<void> _refreshCompleter = Completer<void>();
  final Function(Post) onClick;

  Posts({Key key, this.onClick}) : super(key: key);

  Widget _buildBodyList(List<Post> posts, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<PostBloc>(context).dispatch(RefreshPostEvent());
        return _refreshCompleter.future;
      },
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
            onTap: () {
              if (onClick != null) {
                onClick(posts[index]);
              }
              BlocProvider.of<SelectedPostBloc>(context)
                  .dispatch(SelectPostEvent(posts[index]));
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostEvent, PostState>(
      bloc: BlocProvider.of<PostBloc>(context),
      listener: (BuildContext context, PostState state) {
        if (state is RefreshPostsSuccess) {
          _refreshCompleter.complete();
        }
      },
      child: BlocBuilder<PostEvent, PostState>(
        bloc: BlocProvider.of<PostBloc>(context)..dispatch(RetrievePostEvent()),
        builder: (BuildContext context, PostState state) {
          if (state is PostsInitialState) {
            return Container();
          } else if (state is PostsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostsLoadingSuccess) {
            final posts = state.posts;
            return _buildBodyList(posts, context);
          } else if (state is RefreshPostsSuccess) {
            final posts = state.posts;
            return _buildBodyList(posts, context);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Error"),
                RaisedButton(
                  child: Text("Retry"),
                  onPressed: () => BlocProvider.of<PostBloc>(context)
                      .dispatch(RetrievePostEvent()),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
