import 'package:blocdemo/feature/todo/data/datasources/todo_local_datasource.dart';
import 'package:blocdemo/feature/todo/data/model/todo_model.dart';
import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<List<TodoEntity>> getTodos() async {
    final data = await dataSource.fetchTodos();
    return data.map((e) => TodoModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveTodos(List<TodoEntity> data) async {
    await dataSource.saveTodos(data);
  }
}
