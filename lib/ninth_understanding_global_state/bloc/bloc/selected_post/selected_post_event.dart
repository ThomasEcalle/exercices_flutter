import 'package:equatable/equatable.dart';
import 'package:flutter_lessons/ninth_understanding_global_state/post.dart';


abstract class SelectedPostEvent extends Equatable {
  SelectedPostEvent([List props = const []]) : super(props);
}

class SelectPostEvent extends SelectedPostEvent {
  final Post post;

  SelectPostEvent(this.post);

  @override
  String toString() => 'SelectPostEvent';
}
