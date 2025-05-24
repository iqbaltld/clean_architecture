// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/core/navigation_service/navigation_service.dart'
    as _i788;
import 'package:clean_architecture/core/network/custom_interceptor.dart'
    as _i786;
import 'package:clean_architecture/features/home/data/datasources/home_data_source.dart'
    as _i821;
import 'package:clean_architecture/features/home/data/repositories/home_repository_impl.dart'
    as _i760;
import 'package:clean_architecture/features/home/domain/repositories/home_repository.dart'
    as _i1;
import 'package:clean_architecture/features/home/domain/use_cases/get_recipe_use_case.dart'
    as _i1032;
import 'package:clean_architecture/features/home/presentation/cubit/home/home_cubit.dart'
    as _i422;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i361.Interceptor>(() => _i786.CustomInterceptor(
          gh<_i361.Dio>(),
          gh<_i788.NavigationService>(),
        ));
    gh.factory<_i821.HomeDataSource>(() => _i821.HomeDataSourceImpl(
          gh<_i361.Dio>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i1.HomeRepository>(
        () => _i760.HomeRepositoryImpl(dataSource: gh<_i821.HomeDataSource>()));
    gh.factory<_i1032.GetRecipeUseCase>(
        () => _i1032.GetRecipeUseCase(gh<_i1.HomeRepository>()));
    gh.factory<_i422.HomeCubit>(
        () => _i422.HomeCubit(gh<_i1032.GetRecipeUseCase>()));
    return this;
  }
}
