import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

/// This class is used ONLY for navigation arguments.
///
/// Why we need it:
/// - To avoid passing raw models directly through routes
/// - To make navigation safer and more scalable
/// - To allow adding more parameters later without breaking routes
///
/// Example usage:
/// Navigator.pushNamed(
///   context,
///   AppRoutesName.task_details,
///   arguments: TaskArguments(task: task),
/// );
class TaskArguments {
  /// The task that will be shown in Task Details screen
  final TaskModel task;
  final TaskDetailsCubit? cubit;
  TaskArguments({required this.task, this.cubit});
}
