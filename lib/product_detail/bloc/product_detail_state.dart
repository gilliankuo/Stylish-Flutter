import 'package:equatable/equatable.dart';

import '../product.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.product,
    this.size,
    this.quantity = 1,
  });

  final Product? product;
  final ProductSize? size;
  final int quantity;

  ProductDetailState copyWith({
    Product? product,
    ProductSize? size,
    int? quantity,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, size, quantity];
}
