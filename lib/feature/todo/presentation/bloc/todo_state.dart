import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:equatable/equatable.dart';

enum TodoStatus {
  initial,
  loading,
  loaded,
  error,
}

class TodoState extends Equatable {
  final TodoStatus status;
  final String? message;
  final List<TodoEntity> todoList;
  final int? editIndex;

  const TodoState({this.todoList = const [],required this.status,this.message,this.editIndex});

  factory TodoState.initial() => const TodoState(
    status: TodoStatus.initial,
  );

  TodoState copyWith({
    TodoStatus? status,
    List<TodoEntity>? todoList,
    String? message,
    int? editIndex,
    bool isClearEdit = false,
  }) {
    return TodoState(
      status: status ?? this.status,
      message: message ?? this.message,
      todoList: todoList ?? this.todoList,
      editIndex: isClearEdit ? null : editIndex ?? this.editIndex
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,todoList,editIndex];

}

