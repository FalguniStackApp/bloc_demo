import 'package:blocdemo/core/di/providers.dart';
import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/presentation/providers/todo_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = NotifierProvider<TodoNotifier, TodoState>(() {
  return TodoNotifier();
});

class TodoNotifier extends Notifier<TodoState> {
  @override
  TodoState build() {
    // Determine if we should load initially. For now, we can match Bloc's behavior
    // which seemed to rely on an event. Standard Riverpod often loads in build or on demand.
    // Let's load automatically or provide a method.
    // Given the previous code called 'LoadTodos' event, we can call a load method here or rely on UI to trigger it.
    // To minimize UI changes, let's just initialize state and let UI trigger load if needed,
    // OR calling loadInitial() immediately if that was the bloc behavior.
    // The previous Bloc had `on<LoadTodos>(_onStarted)`.
    return TodoState.initial();
  }

  Future<void> loadTodos() async {
    state = state.copyWith(status: TodoStatus.loading);
    try {
      final getTodos = ref.read(getTodosUseCaseProvider);
      final todos = await getTodos.call();
      state = state.copyWith(status: TodoStatus.loaded, todoList: todos);
    } catch (_) {
      state = state.copyWith(status: TodoStatus.error, message: 'Something went wrong!');
    }
  }

  Future<void> addTodo(String task) async {
    state = state.copyWith(status: TodoStatus.loading);
    try {
      final saveTodos = ref.read(saveTodosUseCaseProvider);
      final List<TodoEntity> dataList = List.from(state.todoList);

      if (state.editIndex == null) {
        int nextId = 1;
        if (dataList.isNotEmpty) {
          nextId = dataList.last.id + 1;
        }
        dataList.add(TodoEntity(id: nextId, title: task));
      } else {
        dataList[state.editIndex!].title = task;
      }

      await saveTodos.call(dataList);
      state = state.copyWith(
          status: TodoStatus.loaded, todoList: dataList, isClearEdit: true);
    } catch (_) {
      state = state.copyWith(status: TodoStatus.error, message: 'Something went wrong!');
    }
  }

  void updateTodoIndex(int index) {
    state = state.copyWith(editIndex: index);
  }

  Future<void> deleteTodo(int index) async {
    state = state.copyWith(status: TodoStatus.loading);
    try {
      final saveTodos = ref.read(saveTodosUseCaseProvider);
      final List<TodoEntity> dataList = List.from(state.todoList);
      dataList.removeAt(index);

      await saveTodos.call(dataList);

      state = state.copyWith(
        status: TodoStatus.loaded,
        todoList: dataList,
      );
    } catch (_) {
      state = state.copyWith(status: TodoStatus.error, message: 'Something went wrong!');
    }
  }
}
