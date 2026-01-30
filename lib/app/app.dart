import 'package:blocdemo/app/app_theme.dart';
import 'package:blocdemo/feature/todo/presentation/pages/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TodoPage(),
          theme: AppTheme().lightTheme,
        ),
      ),
    );
  }
}
