import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_cubit.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 16,
          onPressed: () => context.read<CounterCubit>().decrement(),
          icon: const Icon(Icons.remove),
        ),
        BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Expanded(child: Center(child: Text("$state")));
          },
        ),
        IconButton(
          splashRadius: 16,
          onPressed: () => context.read<CounterCubit>().increment(),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
