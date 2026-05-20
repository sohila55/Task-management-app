import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/models/user_model.dart';

part 'add_new_task_state.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  AddNewTaskCubit() : super(AddNewTaskInitial());

  void addNewTask(
    String title,
    String description,
    DateTime startDateTime,
    DateTime endDateTime,
    List<UserModel> assignedMembers,
  ) {
    final currentState = state;
    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      status: TaskStatus.pending,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      assignedMembers: [],
    );

    taskList.add(newTask);

    emit(AddNewTaskSuccess());
  }
}
