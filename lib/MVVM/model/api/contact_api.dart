import 'package:dio/dio.dart';
import '../../model/contact_model.dart';

class ContactApi {
  final Dio _dio = Dio();

  Future<List<Contact>> getContact() async {
    try {
      final response = await _dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      );

      final List<Contact> contacts = (response.data as List)
          .map((e) => Contact(
                id: e['id'],
                name: e['name'],
                phone: e['phone'],
              ))
          .toList();

      return contacts;
    } catch (error) {
      throw Exception('Failed to fetch contacts: $error');
    }
  }
}
