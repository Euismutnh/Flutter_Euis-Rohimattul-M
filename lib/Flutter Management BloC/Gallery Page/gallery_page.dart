import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Edit Photo/edit_photo.dart';
import '../Model BloC/edit_event.dart';
import '../Model BloC/gallery_bloc.dart';
import '../Model BloC/gallery_state.dart';

class GalleryNewPage extends StatelessWidget {
  final List<String> imageAsset = ["1", "2", "3", "4", "5", "6", "7", "8"];

  GalleryNewPage({Key? key}) : super(key: key);

  String? get newName => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Photo Gallery'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.newImageAsset.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _showBottomSheet(context, index),
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/${state.newImageAsset[index]}.png",
                          height: 130,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.imageAsset[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(
              "asset/${imageAsset[index]}.png",
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      _navigateToAdvancePage(context, index, newName!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _navigateToEditPhotoPage(context, index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('No'),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }

  void _navigateToEditPhotoPage(BuildContext context, int index) async {
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPhotoPage(imageAssetIndex: index),
      ),
    );

    if (newName != null && newName is String) {
      context.read<GalleryBloc>().add(EditPhotoEvent(index, newName));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Photo name edited successfully to $newName'),
        ),
      );
    }
  }

  void _navigateToAdvancePage(BuildContext context, int index, String newName) {
    context.read<GalleryBloc>().add(EditPhotoEvent(index, newName));
    Navigator.pop(context);
  }
}
