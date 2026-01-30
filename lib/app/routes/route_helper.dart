import 'package:blocdemo/feature/todo/presentation/binding/todo_binding.dart';
import 'package:blocdemo/feature/todo/presentation/pages/todo_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String routeInitial = '/';
  // Add other routes here as needed
  // static const String introLoginPage = '/login';

  static List<GetPage> routes = [
    GetPage(
      name: routeInitial,
      page: () => const TodoPage(),
      binding: TodoBinding(),
    ),
  ];
}
