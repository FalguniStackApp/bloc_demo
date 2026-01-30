import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:blocdemo/feature/todo/presentation/controller/todo_controller.dart';
import 'package:blocdemo/feature/todo/presentation/view_model/todo_view_model.dart';
import 'package:get/get.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController(Get.find<TodoRepository>()));
    Get.lazyPut<TodoViewModel>(() => TodoViewModel(Get.find<TodoController>()));
  }
}
