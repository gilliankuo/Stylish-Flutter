import 'package:equatable/equatable.dart';

import '../model/product.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.product,
    this.size,
    this.quantity = 1,
  });

  final Product? product;
  final ProductSize? size;
  final int quantity;

  get currentStock => product?.getStock(size) ?? 0;
  get currentStockText => size != null ? '$currentStock' : '請選擇尺寸';

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
