import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/injection/injection_container.dart';
import 'package:clean_architecture/core/navigation_service/navigation_service.dart';
import 'package:clean_architecture/core/router/app_router.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>(),
      child: MaterialApp(
        title: appName,
        navigatorKey: sl<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
