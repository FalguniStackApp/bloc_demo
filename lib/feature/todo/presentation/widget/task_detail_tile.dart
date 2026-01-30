import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:blocdemo/shared/widget/app_text.dart';
import 'package:flutter/material.dart';

class TaskDetailTile extends StatelessWidget {
  final int index;
  final String title;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskDetailTile({
    super.key,
    required this.title,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.appLightPurple.withAlpha(20),
        border: Border(left: BorderSide(color: AppColors.appLightPurple, width: 2)),
      ),
      child: Row(
        children: [
          SizedBox(width: 5),
          Icon(Icons.task_alt, color: AppColors.appGreen),
          SizedBox(width: 20),
          Expanded(child: AppText(title)),
          SizedBox(width: 10),
          InkWell(
              onTap: onEdit,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.mode_edit_outline_rounded,
                  size: 22,
                  color: AppColors.appPrimary,
                ),
              )),
          InkWell(
              onTap: onDelete,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.delete_rounded,
                  color: AppColors.appRed,
                ),
              )),
        ],
      ),
    );
  }
}
