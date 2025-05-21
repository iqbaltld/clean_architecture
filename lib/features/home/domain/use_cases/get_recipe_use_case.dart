import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/home/domain/entities/recipe.dart';
import 'package:clean_architecture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecipeUseCase {
  final HomeRepository repository;

  GetRecipeUseCase(this.repository);

  Future<Either<Failure, List<Recipe>>> call() async {
    return await repository.getRecipes();
  }
}
