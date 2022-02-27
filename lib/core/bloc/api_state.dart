part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
  final List<Post> posts;

  ApiLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ApiError extends ApiState {
  final String error;

  ApiError({required this.error});

  @override
  List<Object> get props => [error];
}

class ApiEmpty extends ApiState {}

class ApiLoadedPost extends ApiState {
  final Post post;

  ApiLoadedPost({required this.post});

  @override
  List<Object> get props => [post];
}
