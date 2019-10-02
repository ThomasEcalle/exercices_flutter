import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  PostEvent([List props = const []]) : super(props);
}

class RetrievePostEvent extends PostEvent {
  @override
  String toString() => 'RetrievePostEvent';
}

class RefreshPostEvent extends PostEvent {
  @override
  String toString() => 'RefreshePostEvent';
}
