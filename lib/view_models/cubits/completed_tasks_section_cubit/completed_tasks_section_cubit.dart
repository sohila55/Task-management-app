import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';

part 'completed_tasks_section_state.dart';

class CompletedTasksSectionCubit extends Cubit<CompletedTasksSectionState> {
  CompletedTasksSectionCubit() : super(CompletedTasksSectionInitial());

  Future<void> loadCompletedTasks() async {
    try {
      emit(CompletedTasksSectionLoading());

      // Simulate network delay (makes it feel realistic)
      await Future.delayed(Duration(milliseconds: 500));

      // Get completed tasks
      emit(
        CompletedTasksSectionLoaded(
          tasks: taskList
              .where((task) => task.status == TaskStatus.completed)
              .toList(),
        ),
      );
    } catch (e) {
      emit(CompletedTasksSectionError(message: e.toString()));
    }
  }

  Future<void> refreshCompletedTasks() async {
    await loadCompletedTasks();
  }
}
