import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_event.dart';
import 'package:stylish/product_detail/bloc/product_detail_state.dart';
import 'package:stylish/util/responsive_layout.dart';

import '../util/app_bar.dart';
import 'data/product_detail_repository.dart';
import 'model/product.dart';
import 'product_description_section.dart';
import 'product_image_section.dart';
import 'product_info_section.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProductDetailBloc(
          repository: ProductDetailRepositoryImpl(),
        )..add(ProductFetched(productId));
      },
      child: Scaffold(
        appBar: createStylishAppBar(context),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
          return state.product == null
              ? const Center(child: CircularProgressIndicator())
              : ResponsiveLayout(
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
                description: product.story,
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
        description: product.story,
        images: product.descriptionImagesUrl,
      )
    ]);
  }
}
