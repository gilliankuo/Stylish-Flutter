import 'package:flutter/material.dart';
import 'package:stylish/product_detail/product.dart';

class SizeRadioButton extends StatefulWidget {
  final List<ProductSize> options;
  final Function(int) onChanged;
  final int selectedOption;

  const SizeRadioButton({
    super.key,
    required this.options,
    required this.onChanged,
    required this.selectedOption,
  });

  @override
  _SizeRadioButtonState createState() => _SizeRadioButtonState();
}

class _SizeRadioButtonState extends State<SizeRadioButton> {
  int selectedIndex = 0;

  void changeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.options.length,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              changeSelected(index);
              widget.onChanged(index);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42)),
              backgroundColor: selectedIndex == index
                  ? Colors.white54
                  : Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(12),
              minimumSize: Size.zero,
            ),
            child: Text(
              widget.options[index].name,
            ),
          ),
        ),
      ),
    );
  }
}
