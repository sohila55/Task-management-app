import 'package:flutter/material.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/create_new_task/body_titles.dart';

class ProjectProgress extends StatelessWidget {
  const ProjectProgress({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        bodyTitle('Project Progress'),

        PercentCircleIndicator(
          percent: task.progress,
          radius: 30,
          strokeWidth: 2,
          backgroundColor: AppColors.lightblack,
          progress: AppColors.secondaryColor,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          animated: true,
          duration: const Duration(seconds: 1),
        ),
      ],
    );
  }
}
