import 'package:blocdemo/app/app_theme.dart';
import 'package:blocdemo/app/bindings/initial_binding.dart';
import 'package:blocdemo/app/routes/route_helper.dart';
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
          initialBinding: InitialBinding(),
          initialRoute: RouteHelper.routeInitial,
          getPages: RouteHelper.routes,
          theme: AppTheme().lightTheme,
        ),
      ),
    );
  }
}
