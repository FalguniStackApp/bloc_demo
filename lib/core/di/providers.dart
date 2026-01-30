import 'package:blocdemo/feature/todo/data/datasources/todo_local_datasource.dart';
import 'package:blocdemo/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:blocdemo/feature/todo/domain/usecases/get_todos.dart';
import 'package:blocdemo/feature/todo/domain/usecases/save_todos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoLocalDataSourceProvider = Provider<TodoLocalDataSource>((ref) {
  return TodoLocalDataSource();
});

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final dataSource = ref.watch(todoLocalDataSourceProvider);
  return TodoRepositoryImpl(dataSource: dataSource);
});

final getTodosUseCaseProvider = Provider<GetTodos>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return GetTodos(repository);
});

final saveTodosUseCaseProvider = Provider<SaveTodos>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return SaveTodos(repository);
});
