import 'package:equatable/equatable.dart';

import '../product.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.size,
    this.quantity = 1,
  });

  final ProductSize? size;
  final int quantity;

  ProductDetailState copyWith({
    ProductSize? size,
    int? quantity,
  }) {
    return ProductDetailState(
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [size, quantity];
}
