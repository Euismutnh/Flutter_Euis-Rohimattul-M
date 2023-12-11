import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Flutter Management BloC/Gallery Page/gallery_page.dart';
import 'Flutter Management BloC/Model BloC/gallery_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => GalleryBloc(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GalleryBloc>(
      create: (context) => GalleryBloc(),
      child: MaterialApp(
        home: GalleryNewPage(),
      ),
    );
  }
}
