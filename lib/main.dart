import 'package:code_competence2/project/about_us.dart';
import 'package:code_competence2/project/contact_us.dart';
import 'package:code_competence2/project/launcher.dart';
import 'package:code_competence2/project/login.dart';
import 'package:code_competence2/project/main_page.dart';
import 'package:flutter/material.dart';

import 'project/constant/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liceria & Co.',
      home: const LauncherPage(),
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 251, 243, 250)),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => const LauncherPage(),
        HOME_SCREEN: (BuildContext context) => const HomePage(),
        ABOUT_US: (BuildContext context) => const AboutUsPage(),
        CONTACT_US: (BuildContext context) => const ContactUsPage(),
        LOGIN_PAGE: (BuildContext context) => const Login(),
      },
    );
  }
}
