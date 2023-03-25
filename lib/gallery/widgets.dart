import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;

  const BannerCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 180,
        width: 330,
        child: Card(
          color: theme.colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/stylish_placeholder.png'),
          ), // mock
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String price;

  const ProductCard(
      {super.key, required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelLarge;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: theme.colorScheme.primary)),
      child: Row(children: [
        Image.asset(
          'assets/cloth.jpeg',
          height: 120,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: style,
            ),
            Text(
              price,
              style: style,
            ),
          ],
        )
      ]),
    );
  }
}
