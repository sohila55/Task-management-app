import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/subtasks_list_details.dart';

// ------------------------
// Section 3: Tasks List
// ------------------------
class SubTasksList extends StatelessWidget {
  const SubTasksList({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Tasks',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),

        SizedBox(height: size.height * 0.02),

        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SubTasksListDetails(
              title: task.subTasks[index].title,
              taskId: task.id,
              subTask: task.subTasks[index],
            );
          },

          separatorBuilder: (context, index) {
            return SizedBox(height: size.height * 0.02);
          },
          itemCount: task.subTasks.length,
        ),

        //////////////////
      ],
    );
  }
}
