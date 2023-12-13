// lib/Praktikum Json/api_service_post.dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'contact_model.dart';

class ApiServicePost {
  final Dio _dio = Dio();

  Future<void> postDataContact(Contact contact) async {
    try {
      // Lakukan GET request untuk mendapatkan data sebelum POST
      final responseGet = await _dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
      );

      if (kDebugMode) {
        print('GET Response: ${responseGet.data}');
      }

      // Lakukan POST request
      final responsePost = await _dio.post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
        data: contact.toMap(),
      );

      if (responsePost.statusCode == 201) {
        // Successful POST request
        if (kDebugMode) {
          print('POST Response: ${responsePost.data}');
        }
      } else {
        // Unsuccessful POST request
        throw Exception(
          'Failed to post contact. Status code: ${responsePost.statusCode}',
        );
      }
    } catch (error) {
      throw Exception('Failed to post contact: $error');
    }
  }
}
