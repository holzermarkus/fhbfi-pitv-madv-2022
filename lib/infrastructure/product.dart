class Product {
  final String name;
  final String categoryName;

  Product({required this.name, required this.categoryName});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(name: json['name'], categoryName: json['categoryName']);
  }
}
