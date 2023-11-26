import 'package:flutter/material.dart';
import 'edit_photo.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageAsset = ["1", "2", "3", "4", "5", "6", "7", "8"];

  GalleryPage({
    Key? key,
    required void Function(String selectedFileName) onSelectImage,
  })  : _onSelectImage = onSelectImage,
        super(key: key);

  final void Function(String) _onSelectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Photo Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imageAsset.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _showBottomSheet(context, imageAsset[index]),
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset(
                      "asset/${imageAsset[index]}.png",
                      height: 130,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      imageAsset[index],
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
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String imageAsset) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "asset/$imageAsset.png",
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
                        _navigateToAdvancePage(context, imageAsset),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Pergi ke halaman EditPhotoPage
                      Navigator.pop(context);
                      _navigateToEditPhotoPage(context, imageAsset);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Edit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Keluar dari bottom sheet
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('No'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToAdvancePage(BuildContext context, String imageAsset) {
    // Kirim nama file ke AdvancePage
    _onSelectImage(imageAsset);
    Navigator.pop(context); // Tutup halaman GalleryPage
  }

  void _navigateToEditPhotoPage(BuildContext context, String imageAsset) async {
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPhotoPage(imageAsset: imageAsset),
      ),
    );

    if (newName != null && newName is String) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Photo name edited successfully to $newName'),
        ),
      );
    }
  }
}
