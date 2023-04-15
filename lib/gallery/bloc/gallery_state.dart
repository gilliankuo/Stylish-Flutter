import 'package:equatable/equatable.dart';
import 'package:stylish/gallery/model/category.dart' as gallery;

class GalleryState extends Equatable {
  const GalleryState({
    this.categories = const [],
  });

  final List<gallery.Category> categories;

  GalleryState copyWith({
    List<gallery.Category>? categories,
  }) {
    return GalleryState(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [categories];
}
