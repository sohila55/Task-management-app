import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/create_new_task/body_titles.dart';
import 'package:task_manager_app/view/widgets/create_new_task/custom_form_field.dart';

class DescriptionSction extends StatelessWidget {
  const DescriptionSction({
    super.key,
    required this.title,
    required this.descriptionController,
  });

  final String title;
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //// Project Title
        bodyTitle('Description'),

        SizedBox(height: 20),

        ////// Project Description
        CustomFormField(hintText: title, controller: descriptionController),
      ],
    );
  }
}
