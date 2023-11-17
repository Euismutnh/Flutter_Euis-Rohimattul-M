import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Euis Rohimattul Mmutmainnah'),
            Text('Alamat : Lampung'),
            Text('Jenis Program: Flutter'),
          ],
        ),
      ),
    );
  }
}
