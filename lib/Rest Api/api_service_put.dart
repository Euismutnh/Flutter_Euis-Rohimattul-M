// lib/Praktikum Json/api_service_put.dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiServicePut {
  final Dio _dio = Dio();

  Future<void> putRequest() async {
    try {
      // Lakukan PUT request
      final response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'id': 1,
          'title': 'foo',
          'body': 'bar',
          'userId': 1,
        },
      );

      if (response.statusCode == 200) {
        // Successful PUT request
        if (kDebugMode) {
          print('PUT Response: ${response.data}');
        }
      } else {
        // Unsuccessful PUT request
        throw Exception(
          'Failed to put request. Status code: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw Exception('Failed to put request: $error');
    }
  }
}
