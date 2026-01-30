import 'package:blocdemo/feature/todo/presentation/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/helper/extension_helper.dart';

class TodoViewModel {
  final TextEditingController todoTC = TextEditingController();

  void dispose() {
    todoTC.dispose();
  }

  void addTodoTask(BuildContext context, WidgetRef ref) {
    if (todoTC.text.isEmpty) {
      'Please enter task first!'.showError(context);
      return;
    }
    FocusScope.of(context).unfocus();
    
    ref.read(todoProvider.notifier).addTodo(todoTC.text);
    
    todoTC.clear();
  }

  void editTodoTask(int index, WidgetRef ref) {
    final todoList = ref.read(todoProvider).todoList;
    if (index >= 0 && index < todoList.length) {
      todoTC.text = todoList[index].title;
      ref.read(todoProvider.notifier).updateTodoIndex(index);
    }
  }

  void deleteTodoTask(int index, WidgetRef ref) {
    ref.read(todoProvider.notifier).deleteTodo(index);
  }
}