import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:blocdemo/core/constant/app_strings.dart';
import 'package:blocdemo/feature/todo/presentation/providers/todo_state.dart';
import 'package:blocdemo/feature/todo/presentation/providers/todo_provider.dart';
import 'package:blocdemo/feature/todo/presentation/view_models/todo_view_model.dart';
import 'package:blocdemo/feature/todo/presentation/widget/task_detail_tile.dart';
import 'package:blocdemo/shared/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widget/app_button.dart';
import '../../../../shared/widget/app_textfield.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  final TodoViewModel vm = TodoViewModel();

  @override
  void initState() {
    super.initState();
    // Load data when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todoProvider.notifier).loadTodos();
    });
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoProvider);

    // Listen for errors or special states if needed
    ref.listen(todoProvider, (previous, next) {
      if (next.status == TodoStatus.error && next.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.message!)));
      }
      if (next.isClearEdit == true && previous?.isClearEdit != true) {
         // Handle clear edit if needed, though VM clears on add usually.
      }
    });

    return Scaffold(
      appBar: appbarView(),
      body: Builder(
        builder: (context) {
          if (state.status == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                AppTextField(
                  controller: vm.todoTC,
                  hintText: '${state.editIndex == null ? AppStrings.add : AppStrings.update} ${AppStrings.task}',
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: (state.editIndex == null ? AppStrings.add : AppStrings.update).toUpperCase(),
                  width: 100,
                  onPressed: () => vm.addTodoTask(context, ref),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: state.todoList.isEmpty
                      ? AppText(AppStrings.noDataAvailable)
                      : ListView.builder(
                          itemCount: state.todoList.length,
                          itemBuilder: (_, i) {
                            return TaskDetailTile(
                              title: state.todoList[i].title,
                              index: i,
                              onEdit: () => vm.editTodoTask(i, ref),
                              onDelete: () => vm.deleteTodoTask(i, ref),
                            );
                          },
                        ),
                )
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
