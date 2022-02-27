import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:majoo_pretest/core/dio/dio_provider.dart';
import 'package:majoo_pretest/model/post.dart';

class ApiRepository extends DioProvider implements _IApiRepository {
  @override
  Future<Either<String, Post?>> post({required int id}) async {
    try {
      final response = await dio.get('/posts/$id');

      if (response.statusCode == 200) {
        return Right(Post.fromMap(response.data));
      } else {
        return Left('Error Occurred');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) return Right(null);
      return Left('Error Occurred');
    } catch (e) {
      return Left('Error Occurred');
    }
  }

  @override
  Future<Either<String, List<Post>>> posts() async {
    try {
      final response = await dio.get('/posts');

      if (response.statusCode == 200) {
        return Right(response.data.map<Post>((post) => Post.fromMap(post)).toList());
      } else {
        return Left('Error Occurred');
      }
    } catch (e) {
      return Left('Error Occurred');
    }
  }
}

abstract class _IApiRepository {
  Future<Either<String, List<Post>>> posts();
  Future<Either<String, Post?>> post({required int id});
}
