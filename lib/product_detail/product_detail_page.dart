import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/gallery/responsive_layout.dart';
import 'package:stylish/product_detail/bloc/product_detail_bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_event.dart';
import 'package:stylish/product_detail/bloc/product_detail_state.dart';

import 'model/product.dart';
import 'product_description_section.dart';
import 'product_image_section.dart';
import 'product_info_section.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // mock data
    final mockProduct = createMockProduct();

    return BlocProvider(
      create: (context) {
        return ProductDetailBloc()..add(ProductFetched(mockProduct));
      },
      child: Scaffold(
        appBar: AppBar(
            title: Image.asset(
              'assets/stylish_logo.png',
              height: 20,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            automaticallyImplyLeading: false),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
          if (state.product == null) return const SizedBox.shrink();
          return ResponsiveLayout(
            mobileBody: MobileProductDetailPage(product: state.product!),
            webBody: WebProductDetailPage(product: state.product!),
          );
        }),
      ),
    );
  }
}

class WebProductDetailPage extends StatelessWidget {
  final Product product;

  const WebProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800, // MediaQuery.of(context).size.width * 0.6,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            padding: const EdgeInsets.only(top: 8),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ProductImageSection(imageUrl: product.imageUrl)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductInfoSection(
                        product: product,
                      ),
                    ),
                  ),
                ],
              ),
              ProductDescriptionSection(
                description: product.description,
                images: product.descriptionImagesUrl,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileProductDetailPage extends StatelessWidget {
  final Product product;

  const MobileProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: [
      ProductImageSection(imageUrl: product.imageUrl),
      const SizedBox(
        height: 10,
      ),
      ProductInfoSection(
        product: product,
      ),
      ProductDescriptionSection(
        description: product.description,
        images: product.descriptionImagesUrl,
      )
    ]);
  }
}
