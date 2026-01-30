import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:blocdemo/core/constant/app_strings.dart';
import 'package:blocdemo/feature/todo/presentation/controller/todo_controller.dart';
import 'package:blocdemo/feature/todo/presentation/view_model/todo_view_model.dart';
import 'package:blocdemo/feature/todo/presentation/widget/task_detail_tile.dart';
import 'package:blocdemo/shared%20/widget/app_button.dart';
import 'package:blocdemo/shared%20/widget/app_text.dart';
import 'package:blocdemo/shared%20/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoPage extends GetView<TodoViewModel> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access Data Controller for state listening
    final dataController = controller.controller;

    return Scaffold(
      appBar: appbarView(),
      body: Obx(
        () {
          if (dataController.status.value == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              spacing: 20,
              children: [
                AppTextField(
                  controller: controller.todoTC,
                  hintText: '${controller.editIndex.value == null ? AppStrings.add : AppStrings.update} ${AppStrings.task}',
                ),
                AppButton(
                  text: (controller.editIndex.value == null ? AppStrings.add : AppStrings.update).toUpperCase(),
                  width: 100,
                  onPressed: () => controller.addTodoTask(context),
                ),
                Expanded(
                    child: dataController.todoList.isEmpty
                        ? AppText(AppStrings.noDataAvailable)
                        : ListView.builder(
                            itemCount: dataController.todoList.length,
                            itemBuilder: (_, i) {
                              return TaskDetailTile(
                                title: dataController.todoList[i].title,
                                index: i,
                                vm: controller,
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
