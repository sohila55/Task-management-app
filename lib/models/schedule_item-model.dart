import 'package:task_manager_app/models/subTask_model.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/images.dart';

/*
////////////// ScheduleItemModel class //////////////
/// taskTitle: The title of the task.
/// taskId: Unique identifier for the task.
/// startDate: The start date and time of the task.
/// endDate: The end date and time of the task.
/// taskTimeRange: The time range of the task.
/// task: A list of tasks associated with the schedule item.
*/
class ScheduleItemModel {
  final DateTime startDate;
  final DateTime endDate;
  final String taskTimeRange;
  bool isChosen = false;
  final List<TaskModel> task;

  ScheduleItemModel({
    required this.startDate,
    required this.endDate,
    required this.taskTimeRange,
    required this.task,
    this.isChosen = false,
  });

  ScheduleItemModel copyWith({
    DateTime? startDate,
    DateTime? endDate,
    String? taskTimeRange,
    List<TaskModel>? task,
    bool? isChosen,
  }) {
    return ScheduleItemModel(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      taskTimeRange: taskTimeRange ?? this.taskTimeRange,
      task: task ?? this.task,
      isChosen: isChosen ?? this.isChosen,
    );
  }
}

List<ScheduleItemModel> scheduleItems = [
  ScheduleItemModel(
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    taskTimeRange: '10:00 AM - 12:00 PM',
    task: [
      TaskModel(
        id: 'T001',
        title: 'Task A',
        description: 'Description of Task A',
        status: TaskStatus.pending,
        startDateTime: DateTime.now(),
        assignedMembers: [
          UserModel(
            name: 'John Doe',
            image: AppImages.profilePlaceholder,
            id: 'U001',
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
            title: 'Set up project repository',
            status: SubtaskStatus.completed,
          ),
        ],
      ),
    ],
  ),

  // Add more schedule items
  ScheduleItemModel(
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    taskTimeRange: '12:00 AM - 2:00 PM',
    task: [
      TaskModel(
        id: 'T002',
        title: 'Task B',
        description: 'Description of Task B',
        status: TaskStatus.pending,
        startDateTime: DateTime.now(),
        assignedMembers: [
          UserModel(
            name: 'Jane Smith',
            image: AppImages.profilePlaceholder,
            id: 'U002',
          ),
        ],
        subTasks: [
          SubtaskModel(
            id: '1',
            title: 'Design UI mockups',
            status: SubtaskStatus.pending,
          ),
          SubtaskModel(
            title: 'Set up project repository',
            id: '2',
            status: SubtaskStatus.completed,
          ),
        ],
      ),
      TaskModel(
        id: 'T003',
        title: 'Task C',
        description: 'Description of Task C',
        status: TaskStatus.pending,
        startDateTime: DateTime.now(),
        assignedMembers: [
          UserModel(
            name: 'John Doe',
            image: AppImages.profilePlaceholder,
            id: 'U001',
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
            title: 'Set up project repository',
            status: SubtaskStatus.completed,
          ),
        ],
      ),
    ],
  ),
];
