// lib/Praktikum Json/src/home_page.dart
import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'contact_model.dart';
import 'api_service_post.dart';
import 'api_service_put.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required Dio dio}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiServicePost apiServicePost = ApiServicePost();
  final ApiServicePut apiServicePut = ApiServicePut();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POST and PUT Request Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final Contact newContact = Contact(
                  id: 1,
                  name: nameController.text,
                  phone: phoneController.text,
                );

                try {
                  await apiServicePost.postDataContact(newContact);
                  _showSuccessPopup(context, 'POST');
                } catch (error) {
                  if (kDebugMode) {
                    print('POST Error: $error');
                  }
                }
              },
              child: const Text('Send POST Request'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  await apiServicePut.putRequest();
                  _showSuccessPopup(context, 'PUT');
                } catch (error) {
                  if (kDebugMode) {
                    print('PUT Error: $error');
                  }
                }
              },
              child: const Text('Send PUT Request'),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk menampilkan popup sukses
  void _showSuccessPopup(BuildContext context, String requestType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(
              'Data has been successfully ${requestType.toLowerCase()}ed!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
