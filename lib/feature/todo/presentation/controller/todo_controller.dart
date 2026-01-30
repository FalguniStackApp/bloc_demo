
import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:blocdemo/feature/todo/domain/usecases/get_todos.dart';
import 'package:blocdemo/feature/todo/domain/usecases/save_todos.dart';
import 'package:get/get.dart';

enum TodoStatus {
  initial,
  loading,
  loaded,
  error,
}

class TodoController extends GetxController {
  final TodoRepository _repo;
  late final GetTodos _getTodos;
  late final SaveTodos _saveTodos;

  TodoController(this._repo) {
    _getTodos = GetTodos(_repo);
    _saveTodos = SaveTodos(_repo);
  }

  final Rx<TodoStatus> status = TodoStatus.initial.obs;
  final RxList<TodoEntity> todoList = <TodoEntity>[].obs;
  final RxnString message = RxnString();

  @override
  void onInit() {
    super.onInit();
    _getTodosList();
  }

  Future<void> _getTodosList() async {
    status.value = TodoStatus.loading;
    try {
      final todos = await _getTodos.call();
      todoList.value = todos;
      status.value = TodoStatus.loaded;
    } catch (_) {
      status.value = TodoStatus.error;
      message.value = 'Something went wrong!';
    }
  }

  Future<bool> saveTodoList(List<TodoEntity> list) async {
    status.value = TodoStatus.loading;
    try {
      await _saveTodos.call(list);
      todoList.value = list;
      status.value = TodoStatus.loaded;
      return true;
    } catch (_) {
      status.value = TodoStatus.error;
      message.value = 'Something went wrong!';
      return false;
    }
  }
}
