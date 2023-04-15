import 'package:stylish/gallery/data/gallery_service.dart';

import '../../product_detail/model/product.dart';

class GalleryRepository {
  final GalleryService galleryService = GalleryService();

  Future<List<Product>> getProducts(String category) async {
    return galleryService.fetchProducts(category);
  }
}
