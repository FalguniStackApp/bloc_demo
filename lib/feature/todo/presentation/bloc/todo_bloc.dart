import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:blocdemo/feature/todo/domain/usecases/get_todos.dart';
import 'package:blocdemo/feature/todo/domain/usecases/save_todos.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_event.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repo;
  final GetTodos _getTodos;
  final SaveTodos _saveTodos;

  TodoBloc(TodoRepository todoRepo)
      : _repo = todoRepo,
        _getTodos = GetTodos(todoRepo),
        _saveTodos = SaveTodos(todoRepo),
        super(TodoState.initial()) {
    on<LoadTodos>(_onStarted);
    on<AddTodos>(_onAddTask);
    on<UpdateTodos>(_onUpdateTodos);
    on<DeleteTodos>(_onDeleteTodos);
  }

  Future<void> _onStarted(TodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      final todos = await _getTodos.call();
      emit(state.copyWith(status: TodoStatus.loaded,todoList: todos));
    } catch (_) {
      emit(state.copyWith(status: TodoStatus.error,message: 'Something went wrong!'));
    }
  }

  Future<void> _onAddTask(AddTodos event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      final List<TodoEntity> dataList = List.from(state.todoList);
      if(state.editIndex == null){
        int nextId = 1;
        if (dataList.isNotEmpty) {
          nextId = dataList.last.id + 1;
        }
        dataList.add(TodoEntity(id: nextId, title: event.todoTask));
      }
      else{
        dataList[state.editIndex!].title = event.todoTask;
      }
      await _saveTodos.call(dataList);
      emit(state.copyWith(status: TodoStatus.loaded,todoList: dataList,isClearEdit: true));
    } catch (_) {
      emit(state.copyWith(status: TodoStatus.error,message: 'Something went wrong!'));
    }
  }

  Future<void> _onUpdateTodos(UpdateTodos event, Emitter<TodoState> emit) async {
    emit(state.copyWith(editIndex: event.index));
  }

  Future<void> _onDeleteTodos(DeleteTodos event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      final List<TodoEntity> dataList = List.from(state.todoList);
      dataList.removeAt(event.index);

      await _saveTodos.call(dataList);

      emit(state.copyWith(
        status: TodoStatus.loaded,
        todoList: dataList,
      ));
    } catch (_) {
      emit(state.copyWith(status: TodoStatus.error,message: 'Something went wrong!'));
    }
  }
}
