// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/core/errors/exception.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/home/data/datasources/home_data_source.dart';
import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  HomeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await dataSource.getProducts();
      return Right(result.map((element) => element.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
