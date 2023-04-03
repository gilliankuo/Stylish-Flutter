import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 16,
          onPressed: () {},
          icon: const Icon(Icons.remove),
        ),
        // TODO quantity
        const Expanded(child: Center(child: Text("1"))),
        IconButton(
          splashRadius: 16,
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
