import 'dart:convert';

import 'package:blocdemo/shared%20/helper/extension_helper.dart';
import 'package:blocdemo/storage/prefs.dart';
import 'package:blocdemo/feature/todo/domain/entities/todo_entity.dart';

class TodoLocalDataSource {

  Future<List<Map<String, dynamic>>> fetchTodos() async {
    try {
      List<String>? dataList = await getPrefListValue(prefTaskList);

      if (dataList != null && dataList.isNotEmpty) {
        return dataList
            .map((e) => jsonDecode(e) as Map<String, dynamic>)
            .toList();
      }

      return [];
    } catch (e) {
      'Fetch error: $e'.logs;
      return [];
    }
  }

  Future<void> saveTodos(List<TodoEntity> data) async {
    try {
      await setPrefListValue(
        prefTaskList,
        data.map((e) => jsonEncode(e.toJson())).toList(),
      );
    } catch (e) {
      'Fetch error: $e'.logs;
    }
  }
}

