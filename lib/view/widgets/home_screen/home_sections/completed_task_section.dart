import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/routes/arguments/task_arguments.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/widgets/home_screen/completed_tasks_details.dart';
import 'package:task_manager_app/view/widgets/home_screen/texts_lines_home_page.dart';

/// ==================== SECTIONS ====================

/// CompletedTaskSection: Horizontal list of completed tasks
/// Uses a fixed height container to avoid viewport errors
/// Each task is represented by CompletedTasksDetails widget
class CompletedTaskSection extends StatelessWidget {
  const CompletedTaskSection({super.key, required this.tasks});

  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TextsLinesHomePage(leftText: 'Complete Tasks', rightText: 'See All'),

        const SizedBox(height: 16.0),

        SizedBox(
          height: size.height * 0.22, // Match your card height

          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final task = tasks[index]; // You can save it once

              return InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    AppRoutesName.task_details,
                    arguments: TaskArguments(task: task),
                  );
                },
                child: CompletedTasksDetails(
                  bgColor: AppColors.secondaryColor,
                  textColor: AppColors.blackColor,
                  lineColor: AppColors.primaryColor,
                  progress: 0.7,
                  task: tasks[index],

                  /////////////////// write comment to explain the next line
                  /// the next line is a list of images of team members
                  /// assigned to the task
                  teamImages: tasks[index].assignedMembers
                      .map((member) => member.image)
                      .toList(),
                  title: tasks[index].title,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemCount: tasks.length,
          ),
        ),
      ],
    );
  }
}
