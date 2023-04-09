import 'package:equatable/equatable.dart';

import '../product.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class SizeChanged extends ProductDetailEvent {
  const SizeChanged(this.size);

  final ProductSize size;

  @override
  List<Object> get props => [size];
}

class QuantityChanged extends ProductDetailEvent {
  const QuantityChanged(this.quantity);

  final int quantity;

  @override
  List<Object> get props => [quantity];
}
