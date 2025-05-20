import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  HomeCubit(this.getProductsUseCase) : super(HomeInitial());

  Future<void> getProducts() async {
    final result = await getProductsUseCase.call();
    result.fold((error) => emit(HomeError(error.message)),
        (products) => emit(HomeLoaded(products)));
  }
}
