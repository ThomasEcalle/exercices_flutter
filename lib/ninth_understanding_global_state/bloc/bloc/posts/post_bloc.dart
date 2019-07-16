import 'package:bloc/bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/api.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_event.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/posts/post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostsInitialState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is RetrievePostEvent) {
      yield PostsLoading();
      try {
        final posts = await Api.getPost();
        yield PostsLoadingSuccess(posts: posts);
      } catch (error) {
        yield PostsLoadingError();
      }
    }
  }
}
