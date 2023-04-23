import 'package:flutter/material.dart';

AppBar createStylishAppBar(BuildContext context, [Function? onCartClick]) {
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
            })
    ],
  );
}
