import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/home/domain/entities/recipe.dart';
import 'package:dartz/dartz.dart';


abstract class HomeRepository {
  Future<Either<Failure, List<Recipe>>> getRecipes();
}
