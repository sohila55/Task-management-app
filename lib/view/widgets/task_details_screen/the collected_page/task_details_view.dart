import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/routes/arguments/add_subtask.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/main_sections/bottom_fixed_button.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/main_sections/project_details_section.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/main_sections/task_details_appbar.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/main_sections/task_title_section.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/main_sections/tasks_list.dart';
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key, required this.taskId});

  /// The task coming from navigation arguments
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskDetailsAppbar(),

      backgroundColor: AppColors.primaryColor,

      body: BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
        bloc: BlocProvider.of<TaskDetailsCubit>(context),
        buildWhen: (previous, current) =>
            current is TaskDetailsLoaded ||
            current is TaskDetailsLoading ||
            current is TaskDetailsError,

        listenWhen: (previous, current) =>
            current is TaskDetailsDeleted || // ← Changed previous to current!
            current is TaskDetailsError ||
            (current is TaskDetailsLoaded &&
                current.lastAction != null), // ← Added this!
        listener: (context, state) {
          print('🔵 Listener triggered! State: $state'); // ← Add this

          if (state is TaskDetailsDeleted) {
            print('🟢 State is TaskDetailsDeleted'); // ← Add this

            Navigator.of(context, rootNavigator: true).pop();
            // Show snackbar on previous page
            Future.delayed(const Duration(milliseconds: 100), () {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task deleted successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            });
            return; // ← Important: return early!
          }
          if (state is TaskDetailsError) {
            print('🟢 State is TaskDetailsError'); // ← Add this

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is TaskDetailsLoaded && state.lastAction != null) {
            print(
              '🟡 State is TaskDetailsLoaded with lastAction: ${state.lastAction}',
            ); // ← Add this

            String message = '';
            switch (state.lastAction) {
              case 'mark_completed':
                message = 'Task Marked as Completed';
                break;
              case 'mark_in_progress':
                message = 'Task Marked as In Progress';
                break;
              case 'mark_pending':
                message = 'Task Marked as Pending';
                break;
              default:
                print('⚠️ Unknown lastAction: ${state.lastAction}');
                return;
            }
            // Only show snackbar if we have a message
            if (message.isNotEmpty) {
              print('✅ Showing snackbar: $message');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              );
            }
          }
        },

        builder: (context, state) {
          print('🔵 Builder triggered! State: $state'); // ← Add this

          if (state is TaskDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            );
          } else if (state is TaskDetailsError) {
            return Center(child: Text(state.message));
          } else if (state is TaskDetailsLoaded) {
            final tasks = state.task;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // Section 1: Title and Info Row////////////////////
                          const SizedBox(height: 20),
                          ////// Section 2 : Task Title///////////////////
                          // This title will now change correctly
                          // depending on which task was clicked
                          TaskTitleSection(task: tasks),
                          const SizedBox(height: 20),
                          // Section 2: Project Details//////////////////////////
                          ProjectDetailsSection(task: tasks),
                          const SizedBox(height: 20),

                          // Section 3: Task List//////////////////////////
                          SubTasksList(task: tasks),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),

                // Section 4: Bottom Fixed Button//////////////////////////
                AddTaskButton(
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutesName.add_new_subtask,
                      arguments: SubtaskArguments(
                        taskId: taskId,
                        cubit: BlocProvider.of<TaskDetailsCubit>(context),
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
