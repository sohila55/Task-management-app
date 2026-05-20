import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/subTask_model.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/models/user_model.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitial());

  ////////////////////load task details ////////////////////////////
  void loadTaskDetails(String taskId) {
    emit(TaskDetailsLoading());
    Future.delayed(const Duration(seconds: 3));
    final task = taskList.firstWhere((task) => task.id == taskId);
    emit(TaskDetailsLoaded(task: task));
  }

  ////////////////////update task details ////////////////////////////

  void editTaskDetails({
    required String taskId,
    String? newTitle,
    String? newDescription,
    TaskStatus? newStatus,
    DateTime? newStartDateTime,
    DateTime? newEndDateTime,
    List<UserModel>? newAssignedMembers,
    List<SubtaskModel>? newSubTasks,
  }) {
    final currentState = state;

    if (currentState is! TaskDetailsLoaded) {
      emit(TaskDetailsError(message: 'Task not loaded'));
      return;
    }

    emit(TaskDetailsLoading());

    final currentTask = currentState.task;

    // Verify taskId matches (safety check)
    if (currentTask.id != taskId) {
      emit(const TaskDetailsError(message: 'Task ID mismatch'));
      return;
    }

    // Safety check 2: id must match
    if (currentState.task.id != taskId) {
      emit(const TaskDetailsError(message: 'Task ID mismatch'));
      return;
    }

    // Update task
    final updatedTask = currentTask.copyWith(
      title: newTitle,
      description: newDescription,
      startDateTime: newStartDateTime,
      endDateTime: newEndDateTime,
      assignedMembers: newAssignedMembers,
    );

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);

    if (taskIndex == -1) {
      emit(TaskDetailsError(message: 'Task not found'));
      return;
    }
    taskList[taskIndex] = updatedTask;

    emit(TaskDetailsLoaded(task: updatedTask));
  }

  /////////////////// delete task details ////////////////////////////

  Future<void> deleteTaskDetails(String taskId) async {
    print('🔴 deleteTaskDetails CALLED! taskId: $taskId');

    try {
      // Check state BEFORE emitting
      final currentState = state;

      if (currentState is! TaskDetailsLoaded) {
        print('❌ State is not loaded: ${currentState.runtimeType}');
        emit(const TaskDetailsError(message: 'Task not loaded'));
        return;
      }

      // Verify task ID
      if (currentState.task.id != taskId) {
        print('❌ Task ID mismatch');
        emit(const TaskDetailsError(message: 'Task ID mismatch'));
        return;
      }

      print('✅ Checks passed, proceeding with delete');

      // Now emit loading
      emit(const TaskDetailsLoading());

      // Add delay to see loading state
      await Future.delayed(const Duration(milliseconds: 500));

      // Remove from list
      taskList.removeWhere((task) => task.id == taskId);

      // Emit deleted state (no task parameter!)
      emit(const TaskDetailsDeleted());
    } catch (e) {
      print('🔴 ERROR: $e');
      emit(TaskDetailsError(message: e.toString()));
    }
  }
  ////////////////////manage progress circle And Subtasks toggle checkbox //////////////////////////////
  /*
   *** What starts this whole process?
   1- Trigger : when user toggles a subtask checkbox 
      1.1 find the substack user toggled it (need subtack id , task id)
      1.2 change the status of the subtask (need state of the subtask)
      1.3 calculate the  progress percentage of the task (subtasks with status completed count and the whole subtasks count )
      1.4 update the progress percentage of the task (progress percentage = new progress percentageafter calculating step 1.3)
      1.4 update the task witht the new values 
      1.5 save the update to the  task list 
      1.6 emit the new state 
    2- Write pesudo code the process

      function toggleSubtaskStatus( taskId,  subtaskId) {

      task = find task in taskList where task is equal to taskId

      subtask = find subtask in task.subtasks where subtask is equal to subtaskId
      if subtask.status == SubtaskStatus.pending {
        subtask.status = SubtaskStatus.completed
      }else {
        subtask.status = SubtaskStatus.pending
      }

      updatedSubtask = copy of subtask with new status 

for subtask in task.subtasks {
  if subtask.id == updatedSubtask.id {
    subtask = updatedSubtask
  }

}else {
use the original subtask list
}
}    

completedTasksCount = task.subtasks.where((subtask) => subtask.status == SubtaskStatus.completed)
subtasksCount = task.subtasks.length

progressPercentage = (completedTasksCount/subtasksCount) * 100

task.progress = progressPercentage

updatedTask = copy of task with :
task.progress = progressPercentage
task.subtasks = updatedSubtasks

taskList[taskIndex] = updatedTask

emit(TaskDetailsLoaded(task: updatedTask))   

3- convert the pesodu code to the real code

  */

  void toggleSubtaskStatus({
    required String taskId,
    required String subtaskId,
  }) {
    // Pseudocode: for each subtask, if match use updated, else use original

    // Hint: Use .map()
    // Pattern: list.map((item) { if (condition) return new else return old }).toList()

    final task = taskList.firstWhere((task) => task.id == taskId);
    final subtask = task.subTasks.firstWhere(
      (subtask) => subtask.id == subtaskId,
    );

    // toggle status
    final newStatus = subtask.status == SubtaskStatus.completed
        ? SubtaskStatus.pending
        : SubtaskStatus.completed;

    //////////// update subtask status //////////////
    final updatedSubtask = subtask.copyWith(status: newStatus);
    final updatedTask = task.copyWith(
      subTasks: task.subTasks.map((subtask) {
        if (subtask.id == subtaskId) {
          return updatedSubtask;
        } else {
          return subtask;
        }
      }).toList(),
    );

    /// update progress

    final completedCounter = updatedTask.subTasks
        .where((subtask) => subtask.status == SubtaskStatus.completed)
        .length;

    final subtasksCount = updatedTask.subTasks.length;

    final progressPercentage = subtasksCount == 0
        ? 0.0
        : (completedCounter / subtasksCount);

    final updatedTaskProgress = updatedTask.copyWith(
      progress: progressPercentage,
    );

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    taskList[taskIndex] = updatedTaskProgress;

    emit(TaskDetailsLoaded(task: updatedTaskProgress));
  }

  /////////////////////// mark the task as completed ////////////////

  /*
*************** What starts this whole process?
1- trigger : when user marks a completed icon in the up drop menu
    1.1 find the task user marked it (need task id)
    1.2 change the status of the task (need state of the task)
    1.3 update the task witht the new values 
    1.4 save the update to the  task list 
    1.5 emit the new state

2- Write pesudo code the process

function markTaskAsCompleted(taskId) {

task = find task in taskList where task is equal to taskId

task.status = TaskStatus.completed
task.progress = 100
task.subtasks.status =  SubtaskStatus.completed

updatedTask = copy of task with new data


taskList[taskIndex] = updatedTask


emit(TaskDetailsLoaded(task: updatedTask))   
}

3- convert the pesodu code to the real code
    
*/
  void markTaskAsCompleted(String taskId) {
    print('🔴 markTaskAsCompleted CALLED! taskId: $taskId'); // ← Add this

    final task = taskList.firstWhere((task) => task.id == taskId);
    final newStatus = TaskStatus.completed;
    final newProgress = 1.0;
    final updatedTask = task.copyWith(
      status: newStatus,
      progress: newProgress,
      subTasks: task.subTasks
          .map((subtask) => subtask.copyWith(status: SubtaskStatus.completed))
          .toList(),
    );

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    taskList[taskIndex] = updatedTask;

    emit(TaskDetailsLoaded(task: updatedTask, lastAction: 'mark_completed'));
  }

  void markTaskAsInProgress(String taskId) {
    print('🔴 markTaskAsInProgress CALLED! taskId: $taskId'); // ← Add this

    final task = taskList.firstWhere((task) => task.id == taskId);
    final newStatus = TaskStatus.inProgress;

    final updatedTask = task.copyWith(status: newStatus);

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    taskList[taskIndex] = updatedTask;

    emit(TaskDetailsLoaded(task: updatedTask, lastAction: 'mark_in_progress'));
  }

  ///////////  Reopen task (completed → pending)
  void reopenTask(String taskId) {
    print('🔴 markTaskAsPending CALLED! taskId: $taskId'); // ← Add this

    final task = taskList.firstWhere((task) => task.id == taskId);
    final newStatus = TaskStatus.pending;
    final updatedTask = task.copyWith(status: newStatus, progress: 0.0);

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    taskList[taskIndex] = updatedTask;

    emit(TaskDetailsLoaded(task: updatedTask, lastAction: 'mark_pending'));
  }

  ////// pausing task (inprogress → pending)
  void puaseTask(String taskId) {
    final task = taskList.firstWhere((task) => task.id == taskId);
    final newStatus = TaskStatus.pending;
    final updatedTask = task.copyWith(status: newStatus);

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    taskList[taskIndex] = updatedTask;

    emit(TaskDetailsLoaded(task: updatedTask));
  }

  //////////////// add new subtask /////////////////////
  void addSubTask(String taskId, String subtaskTitle) {
    final currentState = state;
    if (currentState is! TaskDetailsLoaded) return;

    final newSubTask = SubtaskModel(
      title: subtaskTitle,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    final UpdatedSubtaskList = [...currentState.task.subTasks, newSubTask];

    final updatedTask = currentState.task.copyWith(
      subTasks: UpdatedSubtaskList,
    );

    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    if (taskIndex == -1) return;
    taskList[taskIndex] = updatedTask;

    emit(TaskDetailsLoaded(task: updatedTask));
  }

  /////////////delete subtask ////////////////////////////////

  void deleteSubtask(String taskId, String subtaskId) {
    final currentState = state;
    if (currentState is! TaskDetailsLoaded) return;
    final taskIndex = taskList.indexWhere((task) => task.id == taskId);
    if (taskIndex == -1) return;

    final subtaskIndex = currentState.task.subTasks.indexWhere(
      (subtask) => subtask.id == subtaskId,
    );

    if (subtaskIndex == -1) return;

    final updatedSubtaskList = List<SubtaskModel>.from(
      currentState.task.subTasks,
    )..removeAt(subtaskIndex);

    final updatedTask = currentState.task.copyWith(
      subTasks: updatedSubtaskList,
    );

    taskList[taskIndex] = updatedTask;
    emit(TaskDetailsLoaded(task: updatedTask));
  }
}
