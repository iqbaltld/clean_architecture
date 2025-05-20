import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
