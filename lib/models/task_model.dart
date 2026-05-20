import 'package:task_manager_app/models/subTask_model.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/images.dart';

/*
////////////// TaskStatus enum //////////////
TaskStatus.pending: The task is not started yet.
TaskStatus.inProgress: The task is currently in progress.
TaskStatus.completed: The task is completed.
*/
enum TaskStatus { pending, inProgress, completed }

/*
////////////// TaskModel class //////////////
/// id: Unique identifier for the task.
/// title: The title of the task.
/// description: A detailed description of the task.
/// status: The current status of the task.
/// startDateTime: The start date and time of the task.
/// endDateTime: The end date and time of the task.
/// assignedMembers: A list of users assigned to the task.
/// subTasks: A list of subtasks associated with the task.
/// progress: The progress of the task as a percentage.
///          Defaults to 0.0 if not provided.

*/

class TaskModel {
  final String id;
  final String title;
  final String description;
  TaskStatus status;
  final DateTime startDateTime;
  final DateTime? endDateTime;
  final List<UserModel> assignedMembers;
  final List<SubtaskModel> subTasks;
  final double progress;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.startDateTime,
    this.endDateTime,
    this.assignedMembers = const [],
    this.subTasks = const [],
    this.progress = 0.0,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    TaskStatus? status,
    DateTime? startDateTime,
    DateTime? endDateTime,
    List<UserModel>? assignedMembers,
    List<SubtaskModel>? subTasks,
    double? progress,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      assignedMembers: assignedMembers ?? this.assignedMembers,
      subTasks: subTasks ?? this.subTasks,
      progress: progress ?? this.progress,
    );
  }
}

List<TaskModel> taskList = [
  TaskModel(
    id: 'T001',
    title: 'Task A',
    description: 'Description of Task A',
    status: TaskStatus.completed,
    startDateTime: DateTime(
      2026, // year
      2, // month
      6, // day
      10, // hour
      0, // minute
    ),
    assignedMembers: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),

      UserModel(
        name: 'Jane Smith',
        image: AppImages.profilePlaceholder,
        id: 'U002',
      ),

      UserModel(
        name: 'Alice Johnson',
        image: AppImages.profilePlaceholder,
        id: 'U003',
      ),
    ],
    subTasks: [
      SubtaskModel(
        id: '1',
        title: 'Design UI mockups',
        status: SubtaskStatus.pending,
      ),
      SubtaskModel(
        id: '2',
        title: 'Implement user interface',
        status: SubtaskStatus.completed,
      ),
      SubtaskModel(title: 'Subtask 6', id: '6', status: SubtaskStatus.pending),
      SubtaskModel(title: 'Subtask 7', id: '7', status: SubtaskStatus.pending),
      SubtaskModel(title: 'Subtask 8', id: '8', status: SubtaskStatus.pending),
      SubtaskModel(title: 'Subtask 9', id: '9', status: SubtaskStatus.pending),
      SubtaskModel(
        title: 'Subtask 10',
        id: '10',
        status: SubtaskStatus.pending,
      ),
    ],
    progress: 0.5,
  ),

  TaskModel(
    id: 'T002',
    title: 'Task B',
    description: 'Description of Task B',
    status: TaskStatus.inProgress,
    startDateTime: DateTime(
      2026, // year
      2, // month
      5, // day
      10, // hour
      0, // minute
    ),

    assignedMembers: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),

      UserModel(
        name: 'Jane Smith',
        image: AppImages.profilePlaceholder,
        id: 'U002',
      ),

      UserModel(
        name: 'Alice Johnson',
        image: AppImages.profilePlaceholder,
        id: 'U003',
      ),
    ],
    subTasks: [
      SubtaskModel(
        id: '1',
        title: 'Design UI mockups',
        status: SubtaskStatus.pending,
      ),
      SubtaskModel(
        id: '2',
        title: 'Implement user interface',
        status: SubtaskStatus.completed,
      ),
    ],
    progress: 0.8,
  ),

  TaskModel(
    id: 'T003',
    title: 'Task C',
    description: 'Description of Task C',
    status: TaskStatus.completed,
    startDateTime: DateTime(
      2026, // year
      2, // month
      9, // day
      10, // hour
      0, // minute
    ),
    assignedMembers: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),

      UserModel(
        name: 'Jane Smith',
        image: AppImages.profilePlaceholder,
        id: 'U002',
      ),

      UserModel(
        name: 'Alice Johnson',
        image: AppImages.profilePlaceholder,
        id: 'U003',
      ),
    ],
    subTasks: [
      SubtaskModel(
        id: '1',
        title: 'Design UI mockups',
        status: SubtaskStatus.pending,
      ),
      SubtaskModel(
        id: '2',
        title: 'Implement user interface',
        status: SubtaskStatus.completed,
      ),
    ],
    progress: 1.0,
  ),
  TaskModel(
    id: 'T004',
    title: 'Task D',
    description: 'Description of Task D',
    status: TaskStatus.pending,
    startDateTime: DateTime(
      2026, // year
      2, // month
      7, // day
      10, // hour
      0, // minute
    ),
  ),
];
