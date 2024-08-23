class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
