import 'package:task_manager_app/models/subTask_model.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/images.dart';

/*
////////////// ProjectModel class //////////////
/// id: Unique identifier for the project.
/// name: The name of the project.
/// description: A detailed description of the project.
/// endDate: The end date of the project.
/// teamMembers: A list of team members associated with the project.
/// progress: The progress of the project as a percentage.
/// tasks: A list of tasks associated with the project.
/// 
*/
class ProjectModel {
  final String id;
  final String name;
  final String description;
  final DateTime endDate;
  final List<UserModel> teamMembers;
  final double progress; // 0.0 to 1.0
  final List<TaskModel> tasks;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.endDate,
    this.teamMembers = const [],
    this.progress = 0.0,
    this.tasks = const [],
  });

  ProjectModel copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? endDate,
    List<UserModel>? teamMembers,
    double? progress,
    List<TaskModel>? tasks,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      endDate: endDate ?? this.endDate,
      teamMembers: teamMembers ?? this.teamMembers,
      progress: progress ?? this.progress,
      tasks: tasks ?? this.tasks,
    );
  }
}

List<ProjectModel> projectsList = [
  //////////////////// item 1
  ProjectModel(
    id: 'P001',
    name: 'Project A',
    description: 'Description of Project A',
    endDate: DateTime.now(),
    teamMembers: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),
    ],
    progress: 0.5,
    tasks: [
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
          SubtaskModel(
            id: '3',
            title: 'Implement authentication module',
            status: SubtaskStatus.pending,
          ),
        ],
      ),
    ],
  ),

  ////////////// item 2
  ProjectModel(
    id: 'P001',
    name: 'Project A',
    description: 'Description of Project A',
    endDate: DateTime.now(),
    teamMembers: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),
    ],
    progress: 0.2,
    tasks: [
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
          SubtaskModel(
            id: '3',
            title: 'Implement authentication module',
            status: SubtaskStatus.pending,
          ),
        ],
      ),
    ],
  ),
];
