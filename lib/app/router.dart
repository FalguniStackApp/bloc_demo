
import 'package:blocdemo/core/di/injection.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_event.dart';
import 'package:blocdemo/feature/todo/presentation/pages/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => BlocProvider<TodoBloc>(
          create: (_) => sl<TodoBloc>()..add(LoadTodos()),
          child: const TodoPage(),
        ),
      ),
    ],
  );
}
