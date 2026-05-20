import 'package:flutter/material.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/colors.dart';

class ProjectDetailsSection extends StatelessWidget {
  const ProjectDetailsSection({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //// Project Title
        const Text(
          'Project Details',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),

        SizedBox(height: size.height * 0.03),

        ////// Project Description
        Text(
          task.description,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
          ),
        ),

        SizedBox(height: size.height * 0.02),

        ////////// Project Progress
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Project Progress',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),

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
        ),
      ],
    );
  }
}
