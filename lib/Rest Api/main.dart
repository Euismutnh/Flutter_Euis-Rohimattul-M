import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'home.dart';

void main() {
  final Dio dio = Dio();
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  final Dio dio;

  const MyApp({Key? key, required this.dio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(dio: dio),
    );
  }
}
