import 'package:stylish/product_detail/data/product_detail_service.dart';

import '../model/product.dart';

abstract class ProductDetailRepository {
  Future<Product> getProduct(int productId);
}

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final ProductDetailService productDetailService = ProductDetailService();

  @override
  Future<Product> getProduct(int productId) async {
    return productDetailService.fetchProductDetail(productId);
  }
}
