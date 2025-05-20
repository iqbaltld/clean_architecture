import 'package:clean_architecture/app.dart';
import 'package:clean_architecture/core/injection/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(MyApp());
}
