/*
////////////// SubtaskStatus enum //////////////
SubtaskStatus.pending: The subtask is not completed yet.
SubtaskStatus.completed: The subtask is completed.
*/
import 'package:task_manager_app/models/task_model.dart';

enum SubtaskStatus { pending, completed }

/*
////////////// SubtaskModel class //////////////
/// id: Unique identifier for the subtask.
/// title: The title of the subtask.
/// status: The current status of the subtask.
*/
class SubtaskModel {
  final String id;
  final String title;
  SubtaskStatus? status;
  final TaskModel? TaskId;

  SubtaskModel({
    required this.title,
    required this.id,
    this.status,
    this.TaskId,
  });

  SubtaskModel copyWith({
    String? title,
    String? id,
    bool? isCompleted,
    SubtaskStatus? status,
    TaskModel? TaskId,
  }) {
    return SubtaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      status: status ?? status,
      TaskId: TaskId ?? TaskId,
    );
  }

  bool get isCompleted => status == SubtaskStatus.completed;
}

List<SubtaskModel> subtaskList = [
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
  SubtaskModel(
    id: '3',
    title: 'Test user interface',
    status: SubtaskStatus.pending,
  ),
  SubtaskModel(
    id: '4',
    title: 'Deploy to production',
    status: SubtaskStatus.pending,
  ),
  SubtaskModel(
    id: '5',
    title: 'Release to users',
    status: SubtaskStatus.pending,
  ),
  SubtaskModel(title: 'Subtask 6', id: '6', status: SubtaskStatus.pending),
  SubtaskModel(title: 'Subtask 7', id: '7', status: SubtaskStatus.pending),
  SubtaskModel(title: 'Subtask 8', id: '8', status: SubtaskStatus.pending),
  SubtaskModel(title: 'Subtask 9', id: '9', status: SubtaskStatus.pending),
  SubtaskModel(title: 'Subtask 10', id: '10', status: SubtaskStatus.pending),
];
