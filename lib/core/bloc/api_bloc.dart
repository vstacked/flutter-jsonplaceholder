import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majoo_pretest/core/repositories/api_repository.dart';
import 'package:majoo_pretest/model/post.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiRepository _repository;
  ApiBloc(this._repository) : super(ApiInitial()) {
    on<ApiPosts>((event, emit) async {
      emit(ApiLoading());
      final response = await _repository.posts();
      response.fold(
        (error) => emit(ApiError(error: error)),
        (posts) => emit(ApiLoaded(posts: posts)),
      );
    });
    on<ApiPost>((event, emit) async {
      emit(ApiLoading());
      final response = await _repository.post(id: event.id);
      response.fold(
        (error) => emit(ApiError(error: error)),
        (post) => emit(post != null ? ApiLoadedPost(post: post) : ApiEmpty()),
      );
    });
  }
}
