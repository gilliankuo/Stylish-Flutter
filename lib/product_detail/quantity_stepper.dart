import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_state.dart';

import 'bloc/product_detail_event.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 16,
          onPressed: () =>
              context.read<ProductDetailBloc>().add(const QuantityChanged(-1)),
          icon: const Icon(Icons.remove),
        ),
        BlocBuilder<ProductDetailBloc, ProductDetailState>(
          buildWhen: (previous, current) =>
              previous.quantity != current.quantity,
          builder: (context, state) {
            return Expanded(child: Center(child: Text("${state.quantity}")));
          },
        ),
        IconButton(
          splashRadius: 16,
          onPressed: () =>
              context.read<ProductDetailBloc>().add(const QuantityChanged(1)),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
