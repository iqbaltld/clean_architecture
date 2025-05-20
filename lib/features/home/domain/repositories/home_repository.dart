import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:dartz/dartz.dart';


abstract class HomeRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
