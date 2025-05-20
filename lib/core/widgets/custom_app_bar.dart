import 'package:clean_architecture/features/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Demo App",
        style: TextStyle(color: Colors.white),
      ),
      flexibleSpace: Container(
        color: Colors.blue,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: BlocBuilder<CartCubit, int>(
            builder: (context, count) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    iconSize: 35,
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      // Handle cart page navigation here
                    },
                  ),
                  if (count > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        constraints:
                            const BoxConstraints(minWidth: 22, minHeight: 22),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
