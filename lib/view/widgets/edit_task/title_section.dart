import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/create_new_task/body_titles.dart';
import 'package:task_manager_app/view/widgets/create_new_task/custom_form_field.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.titleController,
  });

  final String title;
  final TextEditingController titleController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyTitle('Task Title'),

        CustomFormField(controller: titleController, hintText: title),
      ],
    );
  }
}
