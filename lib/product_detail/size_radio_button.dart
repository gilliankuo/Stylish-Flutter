import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_event.dart';
import 'package:stylish/product_detail/model/product.dart';

import 'bloc/product_detail_bloc.dart';
import 'bloc/product_detail_state.dart';

class SizeRadioButton extends StatelessWidget {
  final List<ProductSize> options;

  const SizeRadioButton({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            options.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<ProductDetailBloc>()
                      .add(SizeChanged(options[index]));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42)),
                  backgroundColor: state.size == options[index]
                      ? Colors.white54
                      : Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(12),
                  minimumSize: Size.zero,
                ),
                child: Text(
                  options[index].name,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
