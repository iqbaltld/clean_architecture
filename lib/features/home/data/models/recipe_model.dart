import 'package:clean_architecture/features/home/domain/entities/recipe.dart';

class RecipeModel {
  final String name;
  final String image;
  final String difficulty;
  final String cuisine;
  final int prepTimeMinutes;
  final double rating;
  const RecipeModel({
    required this.name,
    required this.image,
    required this.difficulty,
    required this.cuisine,
    required this.prepTimeMinutes,
    required this.rating,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        name: json['name'] as String,
        image: json['image'] as String,
        difficulty: json['difficulty'] as String,
        cuisine: json['cuisine'] as String,
        prepTimeMinutes: (json['prepTimeMinutes'] as num).toInt(),
        rating: (json['rating'] as num).toDouble(),
      );

  /// Converts this model into an Entity
  Recipe toEntity() {
    return Recipe(
      name: name,
      image: image,
      difficulty: difficulty,
      cuisine: cuisine,
      prepTimeMinutes: prepTimeMinutes,
      rating: rating,
    );
  }
}
