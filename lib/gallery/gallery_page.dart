import 'package:flutter/material.dart';

import 'category.dart';
import 'widgets.dart';
import 'responsive_layout.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: banners.length,
                  itemBuilder: (context, index) =>
                      BannerCard(imageUrl: banners[index])
              )
          ),
          Expanded(
              child: ResponsiveLayout(
            mobileBody: MobileCategory(
              categories: categories,
            ),
            webBody: WebCategory(
              categories: categories,
            ),
          )),
        ],
      );
    });
  }
}
