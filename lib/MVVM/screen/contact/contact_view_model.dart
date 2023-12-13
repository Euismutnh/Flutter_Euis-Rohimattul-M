import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../model/api/contact_api.dart';
import '../../model/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<void> getAllContacts() async {
    try {
      _contacts = await ContactApi().getContact();
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching contacts: $error');
      }
    }
  }
}
