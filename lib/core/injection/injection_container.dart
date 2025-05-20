import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/injection/injection_container.config.dart';
import 'package:clean_architecture/core/navigation_service/navigation_service.dart';
import 'package:clean_architecture/core/network/custom_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; //service locator

@InjectableInit()
void configureGeneratedDependencies() => sl.init();

Future<void> setupDependencyInjection() async {
  configureGeneratedDependencies();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //dio
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      baseUrl: baseUrl,
    ),
  );
  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
  sl.registerLazySingleton<NavigationService>(
      () => NavigationService(navigatorKey: sl<GlobalKey<NavigatorState>>()));
  sl.registerFactory<CustomInterceptor>(
      () => CustomInterceptor(dio, sl<NavigationService>()));
  dio.interceptors.add(sl<CustomInterceptor>());
  dio.interceptors.add(LogInterceptor(responseBody: true));
}
