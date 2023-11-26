import 'package:flutter/material.dart';

class EditPhotoPage extends StatefulWidget {
  final String imageAsset;

  const EditPhotoPage({Key? key, required this.imageAsset}) : super(key: key);

  @override
  State<EditPhotoPage> createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Photo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "asset/${widget.imageAsset}.png",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'New Photo Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _editPhotoName();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _editPhotoName() {
    String newName = _nameController.text;
    if (newName.isNotEmpty) {
      Navigator.pop(context, newName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a new name'),
        ),
      );
    }
  }
}
