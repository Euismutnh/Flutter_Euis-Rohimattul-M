import 'package:flutter/material.dart';
import 'Praktikum Asset/Soal Praktikum 1/soal_praktikum1.dart';
import 'Praktikum_Advance/soal_prioritas1.dart';
import 'Praktikum_Advance/soal_prioritas2_explorasi.dart';
import 'about_page.dart';
import 'Praktikum_Flutter_Form/Soal_Prioritas 1 & 2/add_contact_page.dart';
import 'more_information_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Euis Rohimattul',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'euisrohimattul@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(title: Text('Home Profile')),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ));
              },
            ),
            ListTile(
              title: const Text(
                'Add Contact',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdvancePage(
                    onSelectImage: '',
                    selectedFileName: '',
                  ),
                ));
              },
            ),
            ListTile(
              title: const Text(
                'Gallery',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GalleryPage(
                    onSelectImage: (String selectedFileName) {},
                  ),
                ));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: const Icon(Icons.add),
            title: const Text(
              'Add Contact',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddContactPage(),
              ));
            },
          ),
          const SizedBox(
            height: 1.0,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: const Text(
              'More Information',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            leading: const Icon(Icons.more_horiz),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MoreInformationPage(),
              ));
            },
          ),
          const SizedBox(
            height: 1.0,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: const Text(
              'Interactive Widget',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            leading: const Icon(Icons.more_horiz),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const InteractiveWidgetPage(),
              ));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting')
      ]),
    );
  }
}
