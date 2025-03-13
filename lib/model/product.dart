class Product {
  final int idProduct;
  final String nameProduct;
  final String brandProduct;
  final String description;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> imageProduct;
  final List<String> theme;
  final dynamic userId;
  final String? firstname_user; 
  final String? lastname_user;

  Product({
    required this.idProduct,
    required this.nameProduct,
    required this.brandProduct,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.imageProduct,
    required this.theme,
    required this.userId,
    this.firstname_user,       
    this.lastname_user, 
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var images = List<String>.from(json['image_product'] ?? []);
    var theme = List<String>.from(json['theme_product'] ?? []);


    Map<String, dynamic>? userData = json['users'];

    return Product(
      idProduct: json['id_product'],
      nameProduct: json['name_product'],
      brandProduct: json['brand_product'],
      description: json['description'],
      price: json['price'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      imageProduct: images,
      theme: theme,
      userId: json['userId'].toString(),
      firstname_user: userData?['firstname_user'],
      lastname_user: userData?['lastname_user'],
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
      'theme_product': theme,
      'userId': userId,
    };
  }
}
