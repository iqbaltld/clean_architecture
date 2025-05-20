import 'package:clean_architecture/features/home/domain/entities/product.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: (json['id'] as num).toInt(),
        title: json['title'] as String,
        description: json['description'] as String,
        price: (json['price'] as num).toDouble(),
      );

  /// Converts this model into an Entity
  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
    );
  }
}
