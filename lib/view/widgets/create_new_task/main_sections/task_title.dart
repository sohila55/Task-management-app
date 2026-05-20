import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/create_new_task/custom_form_field.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(hintText: 'Task Title');
  }
}
