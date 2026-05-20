import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/view/widgets/edit_task/collected_view_page/edit_task_view.dart';

class EditTask extends StatelessWidget {
  const EditTask({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return EditTaskView(task: task);
  }
}
