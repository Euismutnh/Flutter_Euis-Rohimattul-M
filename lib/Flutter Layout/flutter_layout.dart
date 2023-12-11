import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatelessWidget {
  const FlutterLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            final initial = user['name']![0].toUpperCase();

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 56, 168, 86),
                  child: Text(
                    initial,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  user['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(user['address']!),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Dummy data
List<Map<String, String>> userList = [
  {'name': 'Euis Rohimattul', 'address': 'Jln. klp II, Lampung'},
  {'name': 'Michelle', 'address': 'Jakarta Selatan'},
  {'name': 'Radit', 'address': 'Jln. Ahmad Yani, Jakarta'},
  {'name': 'Natasya', 'address': 'Jln. Imam Bonjol, Surakarta'},
  {'name': 'Naufal', 'address': 'Jln. Sabar, No 23, Kedamaian'},
  {'name': 'Ririn', 'address': 'Jln. Melati, No.34, Pringsewu'},
];
