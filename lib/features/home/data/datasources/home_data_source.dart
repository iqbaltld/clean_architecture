import 'package:clean_architecture/core/constants/api_endpoint.dart';
import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/network/api_client.dart';
import 'package:clean_architecture/features/home/data/models/recipe_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeDataSource {
  Future<List<RecipeModel>> getRecipes();
}

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends ApiClientImpl implements HomeDataSource {
  final SharedPreferences sharedPreferences;
  HomeDataSourceImpl(super.dio, this.sharedPreferences);

  @override
  Future<List<RecipeModel>> getRecipes() async {
    return await getRequest<List<RecipeModel>>(
      '$baseUrl/${ApiEndpoint.getRecipes}',
      fromJson: (data) => (data['recipes'] as List)
          .map((element) => RecipeModel.fromJson(element))
          .toList(),
    );
  }
}
