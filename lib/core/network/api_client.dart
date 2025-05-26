import 'package:clean_architecture/core/errors/exception.dart';
import 'package:dio/dio.dart';

abstract class ApiClient {
  Future<T> getRequest<T>(String url,
      {Map<String, dynamic>? queryParams,
      Options? options,
      T Function(dynamic data)? fromJson});

  Future<T> postRequest<T>(String url,
      {Map<String, dynamic>? queryParams,
      dynamic data,
      Options? options,
      T Function(dynamic data)? fromJson});
}

class ApiClientImpl implements ApiClient {
  final Dio dio;

  ApiClientImpl(this.dio);

  @override
  Future<T> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    T Function(dynamic data)? fromJson,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: options,
      );
      return _handleResponse<T>(response, fromJson: fromJson);
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException('An unexpected error occurred. Please try again.');
    }
  }

  @override
  Future<T> postRequest<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    dynamic data,
    Options? options,
    T Function(dynamic data)? fromJson,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParams,
        options: options,
      );
      return _handleResponse<T>(response, fromJson: fromJson);
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException('An unexpected error occurred. Please try again.');
    }
  }

  T _handleResponse<T>(
    Response response, {
    T Function(dynamic data)? fromJson,
  }) {
    if (fromJson != null) {
      return fromJson(response.data);
    }
    return response.data;
  }

  Never _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError) {
      throw ConnectionException(
          'Connection failed. Please check your mobile data or Wi-Fi.');
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw ConnectionException('Connection timed out. Please try again.');
    }
    if (e.response != null && e.response?.statusMessage != null) {
      throw ServerException(e.response!.statusMessage!,
          statusCode: e.response?.statusCode);
    }
    throw ServerException('An unexpected error occurred.\nPlease try again.');
  }
}
