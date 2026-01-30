import 'package:blocdemo/app/app.dart';
import 'package:blocdemo/core/di/injection.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(App());
}
