// arguments/subtask_arguments.dart
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

class SubtaskArguments {
  final String taskId;
  final TaskDetailsCubit cubit;

  SubtaskArguments({required this.taskId, required this.cubit});
}
