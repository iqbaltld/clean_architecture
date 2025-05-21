import 'package:clean_architecture/core/widgets/custom_progress_indicator.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home/home_cubit.dart';
import 'package:clean_architecture/features/home/presentation/screens/widgets/recipe_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'HOME_SCREEN';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.recipes.length, // limiting to 5 for demo
              itemBuilder: (BuildContext context, int index) {
                final item = state.recipes[index];
                return RecipeTile(
                  recipe: item,
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
