import 'package:blocdemo/feature/todo/data/datasources/todo_local_datasource.dart';
import 'package:blocdemo/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoLocalDataSource>(() => TodoLocalDataSource());
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(dataSource: Get.find<TodoLocalDataSource>()));
  }
}
