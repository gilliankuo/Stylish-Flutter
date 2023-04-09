import 'package:bloc/bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_event.dart';
import 'package:stylish/product_detail/bloc/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<SizeChanged>(_onSizeChanged);
    on<QuantityChanged>(_onQuantityChanged);
    on<ProductFetched>(_onProductFetched);
  }

  void _onSizeChanged(
    SizeChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(size: event.size));
  }

  void _onQuantityChanged(
    QuantityChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    final newQuantity = state.quantity + event.quantity;
    if (newQuantity < 0) return;
    emit(state.copyWith(quantity: newQuantity));
  }

  void _onProductFetched(
    ProductFetched event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(product: event.product));
  }
}
