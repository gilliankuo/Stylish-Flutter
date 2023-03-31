import 'package:flutter/material.dart';

import 'widgets.dart';

class Category {
  final String title;
  final List<String> products;

  Category({required this.title, required this.products});
}

class CategorySection extends StatelessWidget {
  final Category category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;

    return Expanded(
        child: SingleChildScrollView(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Center(
          child: Text(
            category.title,
            style: style,
          ),
        ),
        children: [
          for (var product in category.products)
            ProductCard(productName: product, price: "NT\$ 323,000")
        ],
      ),
    ));
  }
}

class MobileCategory extends StatelessWidget {
  final List<Category> categories;

  const MobileCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var category in categories)
          CategorySection(
            category: category,
          )
      ],
    );
  }
}

class WebCategory extends StatelessWidget {
  final List<Category> categories;

  const WebCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        for (var category in categories)
          CategorySection(
            category: category,
          )
      ],
    );
  }
}
