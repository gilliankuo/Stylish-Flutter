import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/gallery/bloc/gallery_bloc.dart';
import 'package:stylish/gallery/bloc/gallery_state.dart';
import 'package:stylish/gallery/data/gallery_repository.dart';
import 'package:stylish/product_detail/product_detail_page.dart';

import '../cart/view/cart_page.dart';
import '../util/app_bar.dart';
import '../util/route_util.dart';
import 'bloc/gallery_event.dart';
import 'category_section.dart';
import '../util/responsive_layout.dart';
import 'widgets.dart';

class GalleryPage extends StatelessWidget {
  // mock data
  var banners = <String>['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  Widget build(BuildContext context) {
    onProductClick(int productId) {
      Navigator.of(context).push(createSlideInRightRoute(ProductDetailPage(
        productId: productId,
      )));
    }

    return Scaffold(
      appBar: createStylishAppBar(context, () {
        Navigator.of(context).push(createSlideInRightRoute(CartPage()));
      }),
      body: LayoutBuilder(builder: (context, constraints) {
        return BlocProvider(
          create: (_) => GalleryBloc(
            repository: GalleryRepositoryImpl(),
          )..add(const CategoriesFetched()),
          child:
              BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
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
                      child: state.categories.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : ResponsiveLayout(
                              mobileBody: MobileCategory(
                                categories: state.categories,
                                onProductClick: onProductClick,
                              ),
                              webBody: WebCategory(
                                categories: state.categories,
                                onProductClick: onProductClick,
                              ),
                            )),
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
