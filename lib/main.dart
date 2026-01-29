import 'package:blocdemo/app/app.dart';
import 'package:blocdemo/core/constant/bloc_observer.dart';
import 'package:blocdemo/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}
