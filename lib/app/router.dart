import 'package:blocdemo/feature/todo/presentation/pages/todo_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const homePage = '/homePage';
}

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: AppRoutes.homePage,
    routes: [
      GoRoute(
        path: AppRoutes.homePage,
        name: 'account',
        builder: (context, state) => const TodoPage(),
      ),
    ],
  );
}
