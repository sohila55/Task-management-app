import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';

import 'package:task_manager_app/view/widgets/task_details_screen/the%20collected_page/task_details_view.dart';
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

class TaskDetails extends StatelessWidget {
  /// We require the task so this screen is never built with null data
  const TaskDetails({super.key, required this.taskId, required this.task});

  /// The task coming from navigation arguments
  final String taskId;
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailsCubit()..loadTaskDetails(taskId),

      child: TaskDetailsView(taskId: taskId),
    );
  }
}
