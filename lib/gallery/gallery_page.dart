import 'package:flutter/material.dart';
import 'package:stylish/product_detail/product_detail_page.dart';

import '../util/route_util.dart';
import 'category.dart';
import 'category_section.dart';
import 'responsive_layout.dart';
import 'widgets.dart';

class GalleryPage extends StatelessWidget {
  // mock data
  var banners = <String>['1', '2', '3', '4', '5', '6', '7', '8'];
  final categories = <Category>[
    Category(title: "女裝", products: ['衣服1', '衣服2', '衣服3', '衣服4', '衣服5']),
    Category(title: "男裝", products: ['衣服1', '衣服2', '衣服3', '衣服4', '衣服5']),
    Category(title: "配件", products: ['衣服1', '衣服2', '衣服3', '衣服4', '衣服5']),
  ];

  @override
  Widget build(BuildContext context) {
    onProductClick() {
      Navigator.of(context)
          .push(createSlideInRightRoute(const ProductDetailPage(
        productId: "1",
      )));
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/stylish_logo.png',
          height: 20,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: banners.length,
                      itemBuilder: (context, index) =>
                          BannerCard(imageUrl: banners[index]))),
              Expanded(
                  child: ResponsiveLayout(
                mobileBody: MobileCategory(
                  categories: categories,
                  onProductClick: onProductClick,
                ),
                webBody: WebCategory(
                  categories: categories,
                  onProductClick: onProductClick,
                ),
              )),
            ],
          ),
        );
      }),
    );
  }
}
