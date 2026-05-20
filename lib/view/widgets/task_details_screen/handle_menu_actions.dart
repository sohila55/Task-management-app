import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/routes/arguments/task_arguments.dart';
import 'package:task_manager_app/utils/routes/routes.dart' show AppRoutesName;
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

////////////////// handle logic parts for each button in the menu //////////////////////////
Future<void> handleMenuActions(BuildContext context, String action) async {
  final cubit = context.read<TaskDetailsCubit>();
  final state = cubit.state;

  if (state is! TaskDetailsLoaded) {
    return _showSnackBar(context, 'Task not loaded');
  }

  switch (action) {
    case 'mark_completed':
      cubit.markTaskAsCompleted(state.task.id);

      break;

    case 'mark_in_progress':
      cubit.markTaskAsInProgress(state.task.id);

      break;

    case 'mark_pending':
      cubit.reopenTask(state.task.id);
      break;

    case 'edit':
      await _navigateToEditPage(context, state.task);

      break;

    case 'delete':
      final confirmed = await _showDeleteConfirmation(context);
      if (confirmed == true && context.mounted) {
        cubit.deleteTaskDetails(state.task.id);
      }
      break;

    default:
      break;
  }
}

///////////////////////// Navigate to Edit Page //////////////////
///
Future<void> _navigateToEditPage(BuildContext context, TaskModel task) async {
  // ✅ grab the existing cubit BEFORE navigating away
  final cubit = context.read<TaskDetailsCubit>();
  final updated = await Navigator.pushNamed(
    context,
    AppRoutesName.edit_task,
    arguments: TaskArguments(task: task, cubit: cubit),
  );
  if (!context.mounted) return;

  if (updated == true) {
    context.read<TaskDetailsCubit>().loadTaskDetails(task.id);

    _showSnackBar(context, 'Task Updated');
  } else {
    print('⚠️ Edit was cancelled');
  }
}

///////////////////// Deleted Alert Dialog //////////////////////
///
Future<bool?> _showDeleteConfirmation(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Task'),
      content: const Text('Are you sure you want to delete this task?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),

          child: const Text('Delete'),
        ),
      ],
    ),
  );
}

///////////////////////////////// helper method //////////////////////////
void _showSnackBar(BuildContext context, String title) {
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 10.0,
      backgroundColor: Colors.red,
      content: Text(title),
    ),
  );
}
