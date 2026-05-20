import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/create_new_task/custom_form_field.dart';
import 'package:task_manager_app/view/widgets/custom_appbar.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

class CreateNewSubtask extends StatefulWidget {
  const CreateNewSubtask({super.key, required this.taskId});
  final String taskId;

  @override
  State<CreateNewSubtask> createState() => _CreateNewSubtaskState();
}

class _CreateNewSubtaskState extends State<CreateNewSubtask> {
  late TextEditingController title;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
  }

  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(title: 'Add New SubTask'),
      backgroundColor: AppColors.primaryColor,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            children: [
              CustomFormField(
                hintText: 'add subtask title',
                maxLength: 20,
                MaxLines: 4,
                controller: title,
              ),

              Spacer(),
              Center(
                child: CustomButton(
                  text: 'Create',
                  bgColor: AppColors.secondaryColor,
                  forColor: AppColors.blackColor,
                  width: size.height * 0.3,
                  onpressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<TaskDetailsCubit>().addSubTask(
                        widget.taskId,

                        title.text.trim(),
                      );
                      Navigator.pop(context, true);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
