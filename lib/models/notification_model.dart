import 'package:task_manager_app/models/projects_model.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/models/user_model.dart';

/*
////////////// NotificationType enum //////////////
NotificationType.taskUpdate: The notification is related to a task update.
NotificationType.message: The notification is related to a message.
NotificationType.projectUpdate: The notification is related to a project update.
*/
enum NotificationType { taskUpdate, message, projectUpdate }

/*
////////////// NotificationModel class //////////////
/// id: Unique identifier for the notification.
/// title: The title of the notification.
/// body: The main content of the notification.
/// timestamp: The date and time when the notification was created.
/// isRead: A flag indicating whether the notification has been read.
/// type: The type of the notification.
/// user: The user associated with the notification (optional).
/// project: The project associated with the notification (optional).
/// task: The task associated with the notification (optional).
*/
class NotificationModel {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;
  final NotificationType type;
  final UserModel? user; // optional, if related to user
  final ProjectModel? project; // optional, if related to project
  final TaskModel? task; // optional, if related to task

  const NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
    required this.type,
    this.user,
    this.project,
    this.task,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? timestamp,
    bool? isRead,
    NotificationType? type,
    UserModel? user,
    ProjectModel? project,
    TaskModel? task,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      user: user ?? this.user,
      project: project ?? this.project,
      task: task ?? this.task,
    );
  }
}

List<NotificationModel> notificationList = [
  NotificationModel(
    id: 'N001',
    title: 'Task Update',
    body: 'Task "Task A" has been updated.',
    timestamp: DateTime.now(),
    type: NotificationType.taskUpdate,
  ),
];
