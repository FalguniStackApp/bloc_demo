import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<TodoEntity>> call() {
    return repository.getTodos();
  }
}
