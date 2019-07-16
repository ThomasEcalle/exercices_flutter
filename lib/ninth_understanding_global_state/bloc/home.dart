import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_event.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_state.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_event.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
            providers: [
              BlocProvider<PostBloc>(
                builder: (BuildContext context) => PostBloc(),
              ),
              BlocProvider<SelectedPostBloc>(
                builder: (BuildContext context) => SelectedPostBloc(),
              ),
            ],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Body(),
                  flex: 2,
                ),
                Expanded(
                  child: SelectedPost(),
                  flex: 1,
                ),
              ],
            )),
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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEvent, PostState>(
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
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
                onTap: () => BlocProvider.of<SelectedPostBloc>(context)
                    .dispatch(SelectPostEvent(posts[index])),
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
