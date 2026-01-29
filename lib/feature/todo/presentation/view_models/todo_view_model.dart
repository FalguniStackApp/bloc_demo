
import 'package:blocdemo/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_event.dart';
import 'package:flutter/material.dart';

import '../../../../shared /helper/extension_helper.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoBloc _todoBloc;
  final TextEditingController todoTC = TextEditingController();

  TodoViewModel(this._todoBloc);

  @override
  void dispose() {
    todoTC.clear();
    super.dispose();
  }

  void addTodoTask(BuildContext context){
    if(todoTC.text.isEmpty){
      'Please enter task first!'.showError(context);
      return;
    }
    FocusScope.of(context).unfocus();
    _todoBloc.add(AddTodos(todoTask: todoTC.text));
    todoTC.clear();
  }

  void editTodoTask(int index){
    todoTC.text = _todoBloc.state.todoList[index].title;
    _todoBloc.add(UpdateTodos(index: index));
  }

  void deleteTodoTask(int index){
    _todoBloc.add(DeleteTodos(index: index));
  }
}