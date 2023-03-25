import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget webBody;

  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.webBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // callback is called every time the constraints change
      if (constraints.maxWidth >= 1000) {
        return webBody;
      } else {
        return mobileBody;
      }
    });
  }
}
