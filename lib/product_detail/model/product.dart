import 'package:json_annotation/json_annotation.dart';
import 'package:stylish/product_detail/model/variant.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  final String category;
  @JsonKey(name: 'main_image')
  final String imageUrl;
  final String title;
  final int price;
  @JsonKey(name: 'texture')
  final String material;
  @JsonKey(defaultValue: "")
  final String thickness;
  @JsonKey(defaultValue: "")
  final String elasticity;
  @JsonKey(name: 'place')
  final String originOfMaterials;
  @JsonKey(defaultValue: "")
  final String processingOrigin;
  final String description;
  @JsonKey(name: 'images')
  final List<String> descriptionImagesUrl;
  final String wash;
  final String note;
  final String story;

  final List<ProductColor> colors;
  final List<String> sizes;
  final List<Variant> variants;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.material,
    required this.thickness,
    required this.elasticity,
    required this.originOfMaterials,
    required this.processingOrigin,
    required this.description,
    required this.colors,
    required this.sizes,
    required this.descriptionImagesUrl,
    required this.variants,
    required this.category,
    required this.note,
    required this.story,
    required this.wash,
  });
}

@JsonSerializable()
class ProductColor {
  final String name;

  // TODO code from API is different from hex code
  @JsonKey(name: 'code')
  final String hex;

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorToJson(this);

  ProductColor({required this.name, required this.hex});
}

enum ProductSize { small, medium, large }

extension ProductSizeExtension on ProductSize {
  String get name {
    switch (this) {
      case ProductSize.small:
        return 'S';
      case ProductSize.medium:
        return 'M';
      case ProductSize.large:
        return 'L';
      default:
        return '';
    }
  }
}

extension ProductExtension on Product {
  // int getStock(ProductSize? selectedSize) {
  //   return variants
  //       .firstWhere((variant) => variant.size == selectedSize,
  //           orElse: () => Variant(ProductSize.small, 0))
  //       .stock;
  // }
  int getStock(String? selectedSize) {
    return variants
        .firstWhere((variant) => variant.size == selectedSize,
            orElse: () => Variant("000000", "s", 0))
        .stock;
  }
}

Product createMockProduct() {
  return Product(
    id: 2023032101,
    imageUrl: "https://picsum.photos/id/13/600/750",
    title: "UNIQLO 特輯極輕羽絨外套",
    price: 323,
    material: "棉 100%",
    thickness: "薄",
    elasticity: "無",
    originOfMaterials: "日本",
    processingOrigin: "中國",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    colors: [
      ProductColor(name: "墨綠", hex: "#1A5625"),
      ProductColor(name: "深藍", hex: "#1e2428")
    ],
    sizes: ["S", "M", "L"],
    descriptionImagesUrl: [
      "https://picsum.photos/id/20/800/400",
      "https://picsum.photos/id/139/800/400",
      "https://picsum.photos/id/89/800/400",
      "https://picsum.photos/id/77/800/400",
    ],
    variants: [
      Variant("#1A5625", "S", 3),
      Variant("#1A5625", "M", 6),
      Variant("#1A5625", "L", 1),
    ],
    category: "女裝",
    note: "note",
    story: "story",
    wash: "wash",
  );
}
