import 'dart:io';

import 'package:flutter/material.dart';

AppBar createStylishAppBar(
  BuildContext context, [
  VoidCallback? onCartClick,
  VoidCallback? onMapClick,
]) {
  return AppBar(
    title: Image.asset(
      'assets/stylish_logo.png',
      height: 20,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    automaticallyImplyLeading: false,
    actions: [
      if (onCartClick != null)
        IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              onCartClick.call();
            }),
      if (onMapClick != null && isAndroid())
        IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              onMapClick.call();
            })
    ],
  );
}

bool isAndroid() {
  try {
    return (Platform.isAndroid);
  } catch (e) {
    return false;
  }
}