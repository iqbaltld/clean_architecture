import 'package:clean_architecture/core/constants/api_endpoint.dart';
import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/network/api_client.dart';
import 'package:clean_architecture/features/home/data/models/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeDataSource {
  Future<List<ProductModel>> getProducts();
}

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends ApiClientImpl implements HomeDataSource {
  final SharedPreferences sharedPreferences;
  HomeDataSourceImpl(super.dio, this.sharedPreferences);

  @override
  Future<List<ProductModel>> getProducts() async {
    return await getRequest<List<ProductModel>>(
      '$baseUrl/${ApiEndpoint.getProducts}',
      fromJson: (data) => (data['products'] as List)
          .map((element) => ProductModel.fromJson(element))
          .toList(),
    );
  }
}
