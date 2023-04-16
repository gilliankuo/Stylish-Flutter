import 'package:flutter/material.dart';

import '../../util/color_util.dart';
import '../model/product.dart';

class ColorBox extends StatelessWidget {
  final ProductColor color;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorBox({
    super.key,
    required this.color,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: InkWell(
        onTap: onTap,
        child: Ink(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: HexColor(color.hex),
              border: isSelected
                  ? Border.all(
                      color: Colors.black,
                      width: 2,
                    )
                  : null,
            )),
      ),
    );
  }
}
