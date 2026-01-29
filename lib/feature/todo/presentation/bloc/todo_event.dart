import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodos extends TodoEvent {
  final String todoTask;
  const AddTodos({required this.todoTask});
}

class UpdateTodos extends TodoEvent {
  final int index;
  const UpdateTodos({required this.index});
}

class DeleteTodos extends TodoEvent {
  final int index;
  const DeleteTodos({required this.index});
}
