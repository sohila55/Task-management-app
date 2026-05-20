import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';

part 'ongoing_tasks_section_state.dart';

class OngoingTasksSectionCubit extends Cubit<OngoingTasksSectionState> {
  OngoingTasksSectionCubit() : super(OngoingTasksSectionInitial());

  Future<void> loadOngoingTasks() async {
    try {
      emit(OngoingTasksSectionLoading());

      // Simulate network delay (makes it feel realistic)
      await Future.delayed(Duration(milliseconds: 500));

      // Get completed tasks
      emit(
        OngoingTasksSectionLoaded(
          tasks: taskList
              .where(
                (task) =>
                    task.status == TaskStatus.inProgress ||
                    task.status == TaskStatus.pending,
              )
              .toList(),
        ),
      );
    } catch (e) {
      emit(OngoingTasksSectionError(message: e.toString()));
    }
  }

  Future<void> refreshOngoingTasks() async {
    await loadOngoingTasks();
  }
}
