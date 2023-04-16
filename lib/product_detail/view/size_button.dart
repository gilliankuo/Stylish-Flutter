import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final String size;
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;

  const SizeButton(
      {super.key,
      required this.size,
      required this.index,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4),
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(
              isSelected ? Colors.black12 : Colors.black54),
          minimumSize: MaterialStateProperty.all<Size>(const Size(40, 35)),
        ),
        child: Text(
          size,
        ),
      ),
    );
  }
}
