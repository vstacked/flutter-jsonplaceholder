import 'dart:io';

import 'package:dio/dio.dart';

abstract class DioProvider {
  BaseOptions _options = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: 12000,
    receiveTimeout: 12000,
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json,
    },
  );

  late Dio dio = Dio(_options);
}
