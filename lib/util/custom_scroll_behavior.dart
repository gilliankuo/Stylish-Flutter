import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

// Ref: https://stackoverflow.com/questions/69154468/horizontal-listview-not-scrolling-on-web-but-scrolling-on-mobile
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}