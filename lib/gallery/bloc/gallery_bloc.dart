import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stylish/gallery/bloc/gallery_state.dart';
import 'package:stylish/gallery/model/category.dart' as gallery;

import '../data/gallery_repository.dart';
import 'gallery_event.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required this.repository}) : super(const GalleryState()) {
    on<CategoriesFetched>(_onCategoriesFetched);
  }

  GalleryRepository repository;

  Future<void> _onCategoriesFetched(
    CategoriesFetched event,
    Emitter<GalleryState> emit,
  ) async {
    // hard coded category
    final futures = [
      repository.getProducts("women"),
      repository.getProducts("men"),
      repository.getProducts("accessories"),
    ];

    final responses = await Future.wait(futures);

    final categories = responses.map((products) {
      final title = getCategoryTitle(products.first.category);
      return gallery.Category(title: title, products: products);
    }).toList();

    emit(state.copyWith(categories: categories));
  }

  String getCategoryTitle(String category) {
    switch (category) {
      case "women":
        return "女裝";
      case "men":
        return "男裝";
      case "accessories":
        return "配件";
      default:
        return "";
    }
  }
}
