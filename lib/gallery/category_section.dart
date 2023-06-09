import 'package:flutter/material.dart';

import 'category.dart';
import 'widgets.dart';

class CategorySection extends StatelessWidget {
  final Category category;
  final VoidCallback onProductClick;
  final bool isExpansionAllow;

  const CategorySection(
      {super.key,
      required this.category,
      required this.onProductClick,
      this.isExpansionAllow = true});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;

    return Expanded(
        child: SingleChildScrollView(
      child: ExpansionTile(
        initiallyExpanded: true,
        trailing: Icon(
          isExpansionAllow ? Icons.arrow_drop_down : null,
        ),
        title: Center(
          child: Text(
            category.title,
            style: style,
          ),
        ),
        children: [
          for (var product in category.products)
            ProductCard(
              productName: product,
              price: "NT\$ 323,000",
              onProductClick: onProductClick,
            )
        ],
      ),
    ));
  }
}

class MobileCategory extends StatelessWidget {
  final List<Category> categories;
  final VoidCallback onProductClick;

  const MobileCategory(
      {super.key, required this.categories, required this.onProductClick});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var category in categories)
          CategorySection(
            category: category,
            onProductClick: onProductClick,
            isExpansionAllow: true,
          )
      ],
    );
  }
}

class WebCategory extends StatelessWidget {
  final List<Category> categories;
  final VoidCallback onProductClick;

  const WebCategory(
      {super.key, required this.categories, required this.onProductClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        for (var category in categories)
          CategorySection(
            category: category,
            onProductClick: onProductClick,
            isExpansionAllow: false,
          )
      ],
    );
  }
}
