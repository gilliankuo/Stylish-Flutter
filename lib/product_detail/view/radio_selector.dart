import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class RadioSelector<T> extends StatelessWidget {
  final List<T> options;
  final int selectedIndex;

  final Widget Function(T, int, bool) childBuilder;

  const RadioSelector(
      {super.key,
      required this.options,
      required this.selectedIndex,
      required this.childBuilder});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.mapIndexed((index, option) {
        return childBuilder(option, index, selectedIndex == index);
      }).toList(),
    );
  }
}
