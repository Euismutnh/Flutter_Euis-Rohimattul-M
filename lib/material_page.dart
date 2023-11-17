import 'package:flutter/material.dart';
import 'about_page.dart';
//import 'widgets/my_row.dart';
import 'add_contact_page.dart';
import 'more_information_page.dart';
import 'interactive_widget.dart'; // Import file AboutPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data yang akan ditampilkan dalam ListView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(title: Text('Home Profile')),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Pindah ke halaman About
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutPage(),
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
            height: 1.0, // Atur tinggi untuk garis batas
            width: double
                .infinity, // Atur lebar untuk garis batas agar sejajar dengan ListItem
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey, // Warna garis batas
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
            height: 1.0, // Atur tinggi untuk garis batas
            width: double
                .infinity, // Atur lebar untuk garis batas agar sejajar dengan ListItem
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey, // Warna garis batas
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
