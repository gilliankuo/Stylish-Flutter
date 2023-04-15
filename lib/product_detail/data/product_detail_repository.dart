import 'package:stylish/product_detail/data/product_detail_service.dart';

import '../model/product.dart';

class ProductDetailRepository {
  final ProductDetailService productDetailService = ProductDetailService();

  Future<Product> getProduct(int productId) async {
    return productDetailService.fetchProductDetail(productId);
  }
}
