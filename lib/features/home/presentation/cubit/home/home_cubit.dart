import 'package:clean_architecture/features/home/domain/entities/recipe.dart';
import 'package:clean_architecture/features/home/domain/use_cases/get_recipe_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetRecipeUseCase getRecipeUseCase;
  HomeCubit(this.getRecipeUseCase) : super(HomeInitial());

  Future<void> getRecipes() async {
    final result = await getRecipeUseCase.call();
    result.fold((error) => emit(HomeError(error.message)),
        (recipes) => emit(HomeLoaded(recipes)));
  }
}
