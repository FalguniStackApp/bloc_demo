import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/presentation/controller/todo_controller.dart';
import 'package:blocdemo/shared%20/helper/extension_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoViewModel extends GetxController {
  final TodoController controller;

  TodoViewModel(this.controller);

  final TextEditingController todoTC = TextEditingController();
  final RxnInt editIndex = RxnInt();

  @override
  void onClose() {
    todoTC.dispose();
    super.onClose();
  }

  Future<void> addTodoTask(BuildContext context) async {
    if (todoTC.text.isEmpty) {
      'Please enter task first!'.showError(context);
      return;
    }
    FocusScope.of(context).unfocus();

    final List<TodoEntity> dataList = List.from(controller.todoList);
    if (editIndex.value == null) {
      int nextId = 1;
      if (dataList.isNotEmpty) {
        nextId = dataList.last.id + 1;
      }
      dataList.add(TodoEntity(id: nextId, title: todoTC.text));
    } else {
      dataList[editIndex.value!].title = todoTC.text;
    }

    final success = await controller.saveTodoList(dataList);
    if (success) {
      editIndex.value = null;
      todoTC.clear();
    }
  }

  void onEdit(int index) {
    todoTC.text = controller.todoList[index].title;
    editIndex.value = index;
  }

  Future<void> deleteTodoTask(int index) async {
    final List<TodoEntity> dataList = List.from(controller.todoList);
    dataList.removeAt(index);
    await controller.saveTodoList(dataList);
  }
}
