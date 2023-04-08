import 'package:flutter/material.dart';

import 'gallery/gallery_page.dart';
import 'util/custom_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Stylish',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          accentColor: Colors.grey,
          backgroundColor: Colors.grey[200],
          errorColor: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: GalleryPage(),
    );
  }
}
