import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'contact_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<void> postDataContact(Contact contact) async {
    try {
      final response = await _dio.post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
        data: contact.toMap(),
      );

      if (response.statusCode == 201) {
        // Successful POST request
        if (kDebugMode) {
          print('POST Response: ${response.data}');
        }
      } else {
        // Unsuccessful POST request
        throw Exception(
            'Failed to post contact. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to post contact: $error');
    }
  }

  Future<Contact> fetchContact() async {
    try {
      final response = await _dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
      );

      final contact = Contact.fromJson(response.data);
      return contact;
    } catch (error) {
      if (kDebugMode) {
        print('GET Error: $error');
      }
      rethrow;
    }
  }

  Future<void> putRequest() async {
    try {
      final response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'id': 1,
          'title': 'foo',
          'body': 'bar',
          'userId': 1,
        },
      );

      if (kDebugMode) {
        print('PUT Response: ${response.data}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('PUT Error: $error');
      }
    }
  }
}
