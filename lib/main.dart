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
      home: const MyHomePage(title: 'STYLiSH'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/stylish_logo.png',
          height: 20,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: Center(child: GalleryPage()),
    );
  }
}
