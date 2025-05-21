import 'package:clean_architecture/core/constants/api_endpoint.dart';
import 'package:clean_architecture/core/injection/injection_container.dart';
import 'package:clean_architecture/core/navigation_service/navigation_service.dart';
import 'package:clean_architecture/features/login/presentation/screens/login_screen.dart';
import 'package:dio/dio.dart';


import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: Interceptor)
class CustomInterceptor extends Interceptor {
  final Dio dio;
  final NavigationService _navigationService;

  CustomInterceptor(this.dio, this._navigationService);

  /// list of endpoints that need to be skipped because we don't want a token to be sent
  final _apisToSkipToken = [
    ApiEndpoint.getRecipes,
  ];

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_apisToSkipToken.any(options.path.contains)) {
      final sp = sl<SharedPreferences>();
      final token = sp.getString('userToken');
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (!_apisToSkipToken.any(err.requestOptions.path.contains) &&
        err.response?.statusCode == 401) {
      _navigationService.navigateAndClearStack(LoginScreen.name);
    }
    return handler.next(err);
  }
}
