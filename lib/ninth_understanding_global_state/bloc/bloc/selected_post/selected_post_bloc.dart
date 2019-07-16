import 'package:bloc/bloc.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_event.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/bloc/bloc/selected_post/selected_post_state.dart';

class SelectedPostBloc extends Bloc<SelectedPostEvent, SelectedPostState> {
  @override
  SelectedPostState get initialState => InitialSelectedPostState();

  @override
  Stream<SelectedPostState> mapEventToState(SelectedPostEvent event) async* {
    if (event is SelectPostEvent) {
      yield PostsSelected(event.post);
    }
  }
}
