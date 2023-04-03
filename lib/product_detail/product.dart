class Product {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final String material;
  final String thickness;
  final String elasticity;
  final String originOfMaterials;
  final String processingOrigin;
  final String description;
  final List<String> descriptionImagesUrl;

  final List<ProductColor> colors;
  final List<ProductSize> sizes;

  Product(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.material,
      required this.thickness,
      required this.elasticity,
      required this.originOfMaterials,
      required this.processingOrigin,
      required this.description,
      required this.colors,
      required this.sizes,
      required this.descriptionImagesUrl});
}

class ProductColor {
  final String name;
  final String hex;

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

Product createMockProduct() {
  return Product(
      id: '2023032101',
      imageUrl: "https://picsum.photos/id/13/600/750",
      name: "UNIQLO 特輯極輕羽絨外套",
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
      sizes: [
        ProductSize.small,
        ProductSize.medium,
        ProductSize.large
      ],
      descriptionImagesUrl: [
        "https://picsum.photos/id/20/800/400",
        "https://picsum.photos/id/139/800/400",
        "https://picsum.photos/id/89/800/400",
        "https://picsum.photos/id/77/800/400",
      ]);
}
