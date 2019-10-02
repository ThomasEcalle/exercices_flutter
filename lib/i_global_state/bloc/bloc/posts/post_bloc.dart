import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_lessons/i_global_state/api.dart';
import 'package:flutter_lessons/i_global_state/bloc/bloc/posts/post_event.dart';
import 'package:flutter_lessons/i_global_state/bloc/bloc/posts/post_state.dart';
import 'package:flutter_lessons/i_global_state/cache.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostsInitialState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is RetrievePostEvent) {
      yield PostsLoading();
      try {
        final posts = await Api.getPost();
        await Cache.insertPosts(posts);
        yield PostsLoadingSuccess(posts: posts);
      } catch (error) {
        if (error is SocketException) {
          final posts = await Cache.getPosts();
          if (posts.isNotEmpty) {
            yield PostsLoadingSuccess(posts: posts);
          }
        }
        yield PostsLoadingError();
      }
    }

    if (event is RefreshPostEvent) {
      try {
        final posts = await Api.getPost();
        await Cache.insertPosts(posts);
        yield RefreshPostsSuccess(posts: posts);
      } catch (error) {
        if (error is SocketException) {
          final posts = await Cache.getPosts();
          if (posts.isNotEmpty) {
            yield RefreshPostsSuccess(posts: posts);
          } else {
            yield PostsLoadingError();
          }
        } else {
          yield PostsLoadingError();
        }
      }
    }
  }

}
