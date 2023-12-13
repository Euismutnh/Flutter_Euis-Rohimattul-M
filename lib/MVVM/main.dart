import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/contact/contact_screen.dart';
import 'screen/contact/contact_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactViewModel>(
          create: (context) => ContactViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactScreen(),
    );
  }
}
