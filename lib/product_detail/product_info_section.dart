import 'package:flutter/material.dart';

import '../util/color_util.dart';
import 'product.dart';
import 'quantity_stepper.dart';
import 'size_radio_button.dart';

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
          product.name,
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
              for (var color in product.colors)
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Container(
                      height: 20, width: 20, color: HexColor(color.hex)),
                )
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
              // RadioListTile(value: "value", groupValue: "groupValue", onChanged: (value) {})
              SizeRadioButton(
                options: product.sizes,
              )
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
        Text("厚薄： ${product.thickness}"),
        Text("彈性： ${product.elasticity}"),
        Text("素材產地 / ${product.originOfMaterials}"),
        Text("加工產地 / ${product.processingOrigin}"),
      ],
    );
  }
}
