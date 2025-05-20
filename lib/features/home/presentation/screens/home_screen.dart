import 'package:clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:clean_architecture/core/widgets/custom_progress_indicator.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home/home_cubit.dart';
import 'package:clean_architecture/features/home/presentation/screens/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'Home_SCREEN';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: 10, // limiting to 5 for demo
              itemBuilder: (BuildContext context, int index) {
                final product = state.products[index];
                return ProductTile(
                  product: product,
                );
              },
            );
          }
          if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const CustomProgressIndicator();
        },
      ),
    );
  }
}
