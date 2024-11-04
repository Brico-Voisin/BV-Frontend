class Product {
  final int idProduct;
  final String nameProduct;
  final String brandProduct;
  final String description;
  final double price;
  final DateTime createdAt;
  final List<String> imageProduct;
  final String userId;

  Product({
    required this.idProduct,
    required this.nameProduct,
    required this.brandProduct,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.imageProduct,
    required this.userId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      idProduct: json['id_product'],
      nameProduct: json['name_product'],
      brandProduct: json['brand_product'],
      description: json['description'],
      price: json['price'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      imageProduct: List<String>.from(json['image_product']),
      userId: json['userId'],
    );
  }
}