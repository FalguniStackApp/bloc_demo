import 'package:blocdemo/feature/todo/data/datasources/todo_local_datasource.dart';
import 'package:blocdemo/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  //Home
  sl.registerFactory<TodoBloc>(
          () => TodoBloc(sl<TodoRepository>()));
  sl.registerLazySingleton<TodoLocalDataSource>(
          () => TodoLocalDataSource());
  sl.registerLazySingleton<TodoRepository>(
          () => TodoRepositoryImpl(dataSource: sl()));


}
