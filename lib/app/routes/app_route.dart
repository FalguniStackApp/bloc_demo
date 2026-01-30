import 'package:blocdemo/app/routes/route_helper.dart';
import 'package:get/get.dart';

class AppRoute {
  static void goToBack() {
    Get.back();
  }

  static void goToIntroLoginPage() {
    // Example from user request
    // Get.offAllNamed(RouteHelper.introLoginPage);
  }

  static void goToAboutPage() {
    // Example from user request
    // Get.toNamed(RouteHelper.aboutPage);
  }
  
  // App specific navigation
  static void goToTodoPage() {
     Get.offAllNamed(RouteHelper.routeInitial);
  }
}
