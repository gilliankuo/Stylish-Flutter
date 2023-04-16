import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/product_detail/view/color_box.dart';

import 'bloc/product_detail_bloc.dart';
import 'bloc/product_detail_event.dart';
import 'bloc/product_detail_state.dart';
import 'model/product.dart';
import 'quantity_stepper.dart';
import 'view/radio_selector.dart';
import 'view/size_button.dart';

class ProductInfoSection extends StatelessWidget {
  final Product product;

  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Widget generalPadding = const SizedBox(height: 12);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          product.id.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        Text(
          "NT\$ ${product.price.toInt()}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Divider(
          thickness: 1,
        ),
        generalPadding,
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "顏色",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const VerticalDivider(
                thickness: 1,
                width: 30,
              ),
              BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  builder: (context, state) {
                return RadioSelector(
                    options: product.colors,
                    selectedIndex: state.selectedColorIndex ?? -1,
                    childBuilder: (color, index, isSelected) {
                      return ColorBox(
                          color: color,
                          index: index,
                          isSelected: isSelected,
                          onTap: () {
                            context
                                .read<ProductDetailBloc>()
                                .add(ColorChanged(index));
                          });
                    });
              })
            ],
          ),
        ),
        generalPadding,
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "尺寸",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const VerticalDivider(
                thickness: 1,
                width: 30,
              ),
              BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  builder: (context, state) {
                return RadioSelector(
                    options: product.sizes,
                    selectedIndex: state.selectedSizeIndex ?? -1,
                    childBuilder: (size, index, isSelected) {
                      return SizeButton(
                          size: size,
                          index: index,
                          isSelected: isSelected,
                          onPressed: () {
                            context
                                .read<ProductDetailBloc>()
                                .add(SizeChanged(index));
                          });
                    });
              })
            ],
          ),
        ),
        generalPadding,
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "數量",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              VerticalDivider(
                thickness: 1,
                width: 30,
              ),
              Expanded(child: QuantityStepper())
            ],
          ),
        ),
        IntrinsicHeight(
          child: Container(
            alignment: Alignment.centerRight,
            child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
              return Text("庫存： ${state.currentStockText}");
            }),
          ),
        ),
        generalPadding,
        FilledButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.black87,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(60),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            ),
          ),
          child: const Text("請選擇尺寸"),
        ),
        const SizedBox(height: 10),
        const Text("實品顏色依單品照為主"),
        Text(product.material),
        Text(product.description),
        Text("素材產地 / ${product.originOfMaterials}"),
      ],
    );
  }
}
