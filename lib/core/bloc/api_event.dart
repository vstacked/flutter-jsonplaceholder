part of 'api_bloc.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class ApiPosts extends ApiEvent {}

class ApiPost extends ApiEvent {
  final int id;

  ApiPost({required this.id});

  @override
  List<Object> get props => [id];
}
