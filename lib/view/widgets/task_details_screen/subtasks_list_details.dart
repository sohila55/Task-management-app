import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/subTask_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/dropdown_menu_of_subtasks.dart';
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

class SubTasksListDetails extends StatelessWidget {
  const SubTasksListDetails({
    super.key,
    required this.title,
    required this.taskId,
    required this.subTask,
  });

  final String taskId;
  final SubtaskModel subTask;
  final String title;
  @override
  Widget build(BuildContext context) {
    final isCompleted = subTask.status == SubtaskStatus.completed;
    return PopupMenuOfSubtasks(
      subtaskId: subTask.id,
      taskId: taskId,
      onselected: (value) {
        if (value == 'Delete') {
          context.read<TaskDetailsCubit>().deleteSubtask(taskId, subTask.id);
        }
        if (value == 'Send to Archive') {}
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey,
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),

              Checkbox(
                activeColor: AppColors.secondaryColor,
                checkColor: AppColors.lightblack,
                shape: CircleBorder(),
                value: isCompleted,

                onChanged: (value) {
                  context.read<TaskDetailsCubit>().toggleSubtaskStatus(
                    taskId: taskId,
                    subtaskId: subTask.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
