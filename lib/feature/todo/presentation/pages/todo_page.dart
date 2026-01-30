import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:blocdemo/core/constant/app_strings.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:blocdemo/feature/todo/presentation/bloc/todo_state.dart';
import 'package:blocdemo/feature/todo/presentation/view_models/todo_view_model.dart';
import 'package:blocdemo/feature/todo/presentation/widget/task_detail_tile.dart';
import 'package:blocdemo/shared/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widget/app_button.dart';
import '../../../../shared/widget/app_textfield.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TodoViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = TodoViewModel(context.read<TodoBloc>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarView(),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              spacing: 20,
              children: [
                AppTextField(
                  controller: vm.todoTC,
                  hintText: '${state.editIndex == null ? AppStrings.add : AppStrings.update} ${AppStrings.task}',
                ),
                AppButton(
                  text: (state.editIndex == null ? AppStrings.add : AppStrings.update).toUpperCase(),
                  width: 100,
                  onPressed: () => vm.addTodoTask(context),
                ),
                SizedBox(height: 5,),
                Expanded(child:
                state.todoList.isEmpty
                    ? AppText(AppStrings.noDataAvailable)
                    : ListView.builder(
                  itemCount: state.todoList.length,
                  itemBuilder: (_, i) {
                    return TaskDetailTile(title: state.todoList[i].title,
                      index: i,
                      vm: vm,);
                  }
                  ,
                ))
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar appbarView(){
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
