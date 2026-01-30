import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:blocdemo/core/constant/app_strings.dart';
import 'package:blocdemo/core/di/injection.dart';
import 'package:blocdemo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:blocdemo/feature/todo/presentation/controller/todo_controller.dart';
import 'package:blocdemo/feature/todo/presentation/view_model/todo_view_model.dart';
import 'package:blocdemo/feature/todo/presentation/widget/task_detail_tile.dart';
import 'package:blocdemo/shared%20/widget/app_button.dart';
import 'package:blocdemo/shared%20/widget/app_text.dart';
import 'package:blocdemo/shared%20/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller handles data
    final controller = Get.put(TodoController(sl<TodoRepository>()));
    // ViewModel handles UI logic and interactions
    final viewModel = Get.put(TodoViewModel(controller));

    return Scaffold(
      appBar: appbarView(),
      body: Obx(
        () {
          if (controller.status.value == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              spacing: 20,
              children: [
                AppTextField(
                  controller: viewModel.todoTC,
                  hintText: '${viewModel.editIndex.value == null ? AppStrings.add : AppStrings.update} ${AppStrings.task}',
                ),
                AppButton(
                  text: (viewModel.editIndex.value == null ? AppStrings.add : AppStrings.update).toUpperCase(),
                  width: 100,
                  onPressed: () => viewModel.addTodoTask(context),
                ),
                Expanded(
                    child: controller.todoList.isEmpty
                        ? AppText(AppStrings.noDataAvailable)
                        : ListView.builder(
                            itemCount: controller.todoList.length,
                            itemBuilder: (_, i) {
                              return TaskDetailTile(
                                title: controller.todoList[i].title,
                                index: i,
                                vm: viewModel,
                              );
                            },
                          ))
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar appbarView() {
    return AppBar(
      title: AppText(
        AppStrings.appName,
        fontSize: 20,
        color: AppColors.appWhite,
      ),
      backgroundColor: AppColors.appLightPurple,
      centerTitle: true,
    );
  }
}
