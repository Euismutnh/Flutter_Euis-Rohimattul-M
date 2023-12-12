import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:logger/logger.dart';
import 'constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();
  final List<String> imageSlider = [
    'About Us.png',
    'Contact Us.png',
    'Login.png',
  ];

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liceria & Co.'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color.fromARGB(255, 251, 243, 250),
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
                'About Us',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, ABOUT_US);
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, CONTACT_US);
              },
            ),
            ListTile(
              title: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, LOGIN_PAGE);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                initialPage: 0,
              ),
              items: imageSlider.map((fileImage) {
                return GestureDetector(
                  onTap: () {
                    switch (fileImage) {
                      case 'About Us.png':
                        Navigator.pushNamed(context, ABOUT_US);
                        break;
                      case 'Contact Us.png':
                        Navigator.pushNamed(context, CONTACT_US);
                        break;
                      case 'Login.png':
                        Navigator.pushNamed(context, LOGIN_PAGE);
                        break;
                      default:
                        break;
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/$fileImage',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'cart')
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          onTabTapped(index);

          if (index == 0) {
            Navigator.pushReplacementNamed(context, HOME_SCREEN);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, ABOUT_US);
          }
        },
        selectedItemColor: Colors.deepPurple,
      ),
    );
  }
}
