import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'LOGIN_SCREEN';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("LOGIN"),
      ),
    );
  }
}
