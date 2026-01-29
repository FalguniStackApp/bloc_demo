import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';

class SaveTodos {
  final TodoRepository repository;

  SaveTodos(this.repository);

  Future<void> call(List<TodoEntity> data) {
    return repository.saveTodos(data);
  }
}