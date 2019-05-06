import 'package:dio/dio.dart';

import 'package:flutter_architecture/src/model/dog.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dog.ceo/api'));

  Future<List<Dog>> getDogs(int count) async {
    final response = await _dio.get("/breeds/image/random/$count");
    final urls = response.data['message'] as List<dynamic>;
    return urls.map((url) => Dog(url)).toList();
  }
}
