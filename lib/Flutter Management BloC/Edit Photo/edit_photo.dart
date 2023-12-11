import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model BloC/gallery_bloc.dart';
import '../Model BloC/gallery_event.dart';
import '../Model BloC/gallery_state.dart';

class EditPhotoPage extends StatefulWidget {
  final int imageAssetIndex;

  const EditPhotoPage({Key? key, required this.imageAssetIndex})
      : super(key: key);

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
            BlocBuilder<GalleryBloc, GalleryState>(
              builder: (context, state) {
                return Image.asset(
                  "asset/${state.imageAsset[widget.imageAssetIndex]}.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                );
              },
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
                _editPhotoName(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _editPhotoName(BuildContext context) {
    String newName = _nameController.text;
    if (newName.isNotEmpty) {
      // Menggunakan BLoC untuk mengirim event ke galeri
      context
          .read<GalleryBloc>()
          .add(EditPhotoEvent(widget.imageAssetIndex, newName));
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
