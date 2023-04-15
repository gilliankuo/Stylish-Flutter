import 'package:bloc/bloc.dart';
import 'package:stylish/product_detail/bloc/product_detail_event.dart';
import 'package:stylish/product_detail/bloc/product_detail_state.dart';
import 'package:stylish/product_detail/data/product_detail_repository.dart';
import 'package:stylish/product_detail/model/product.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<SizeChanged>(_onSizeChanged);
    on<QuantityChanged>(_onQuantityChanged);
    on<ProductFetched>(_onProductFetched);
  }

  final _repository = ProductDetailRepository();

  void _onSizeChanged(
    SizeChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(size: event.size, quantity: 1));
  }

  void _onQuantityChanged(
    QuantityChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    final newQuantity = state.quantity + event.quantity;
    final stock = state.product?.getStock(state.size) ?? 0;

    if (newQuantity < 0 || newQuantity > stock) return;
    emit(state.copyWith(quantity: newQuantity));
  }

  Future<void> _onProductFetched(
    ProductFetched event,
    Emitter<ProductDetailState> emit,
  ) async {
    final product = await _repository.getProduct(event.productId);
    emit(state.copyWith(product: product));
  }
}
