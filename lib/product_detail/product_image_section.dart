import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;

  const ProductImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
