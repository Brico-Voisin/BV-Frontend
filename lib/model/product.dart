import 'dart:convert';

class Product {
  final int idProduct;
  final String nameProduct;
  final String brandProduct;
  final String description;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> imageProduct;
  final dynamic userId;

  Product({
    required this.idProduct,
    required this.nameProduct,
    required this.brandProduct,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.imageProduct,
    required this.userId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var images = List<String>.from(json['image_product'] ?? []);
    return Product(
      idProduct: json['id_product'],
      nameProduct: json['name_product'],
      brandProduct: json['brand_product'],
      description: json['description'],
      price: json['price'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      imageProduct: images,
      userId: json['userId'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': idProduct,
      'name_product': nameProduct,
      'brand_product': brandProduct,
      'description': description,
      'price': price,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'image_product': imageProduct,
      'userId': userId,
    };
  }
}
