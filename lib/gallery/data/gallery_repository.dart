import 'package:stylish/gallery/data/gallery_service.dart';

import '../../product_detail/model/product.dart';

abstract class GalleryRepository {
  Future<List<Product>> getProducts(String category);
}

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryService galleryService = GalleryService();

  @override
  Future<List<Product>> getProducts(String category) async {
    return galleryService.fetchProducts(category);
  }
}
