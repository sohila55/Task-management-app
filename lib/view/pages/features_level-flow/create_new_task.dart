import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/routes/arguments/add_member_argument.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/widgets/create_new_task/body_titles.dart';
import 'package:task_manager_app/view/widgets/create_new_task/custom_form_field.dart';
import 'package:task_manager_app/view/widgets/create_new_task/main_sections/add_team_member.dart';
import 'package:task_manager_app/view/widgets/custom_appbar.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';
import 'package:task_manager_app/view/widgets/edit_task/date_section.dart';
import 'package:task_manager_app/view/widgets/edit_task/team_member_section.dart';
import 'package:task_manager_app/view_models/cubits/add_new_task_cubit/add_new_task_cubit.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late DateTime startDate;
  late DateTime endDate;
  List<UserModel> teamMembers = [];
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    startDate = DateTime.now();
    endDate = DateTime.now().add(const Duration(days: 1));
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  //////////////// add team member /////////////////////////

  Future<void> _addTeamMembers() async {
    final cubit = context.read<AddNewTaskCubit>();

    final result = await Navigator.pushNamed<List<UserModel>>(
      context,
      AppRoutesName.add_team_members,
      arguments: AddMemberArgument(selectedMembers: teamMembers),
    );
    if (result != null) {
      setState(() {
        teamMembers = result;
      });
    }
  }
  //////////////// Save task logic //////////////////////////

  void saveTask() {
    if (!formKey.currentState!.validate()) return;

    // show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    final cubit = context.read<AddNewTaskCubit>();

    cubit.addNewTask(
      titleController.text.trim(),
      descriptionController.text.trim(),
      startDate,
      endDate,
      teamMembers,
    );

    if (!context.mounted) return;
    //close loading
    Navigator.pop(context);
    //close screen with signal success
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(title: 'Create New Task'),

      // backgroundColor,
      backgroundColor: AppColors.primaryColor,

      body: BlocListener<AddNewTaskCubit, AddNewTaskState>(
        bloc: context.read<AddNewTaskCubit>(),
        listenWhen: (previous, current) => current is AddNewTaskSuccess,
        listener: (context, state) {
          if (state is AddNewTaskError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1: Title and Info Row////////////////////
                const SizedBox(height: 20),
                bodyTitle('Task Title'),

                SizedBox(height: size.height * 0.02),

                CustomFormField(
                  hintText: 'Task Title',
                  controller: titleController,
                ),

                // Section 2 : Task Details//////////////////////////
                bodyTitle('Task Details'),

                SizedBox(height: size.height * 0.02),

                SingleChildScrollView(
                  child: CustomFormField(
                    hintText: 'Task Details',
                    MaxLines: 5,
                    controller: descriptionController,
                  ),
                ),

                ////////////////// Section 3: Team Membres////////////////////////
                TeamMemberSection(
                  selectedMembers: teamMembers,
                  onAddMember: _addTeamMembers,
                  onDeleteMember: (user) {
                    setState(() {
                      teamMembers.remove(user);
                    });
                  },
                ),
                //////////////////// Section 4 : Add Time & Date //////////////////
                SizedBox(height: size.height * 0.02),

                DateSection(
                  startDate: startDate,
                  endDate: endDate,
                  startDateOnChanged: (date) {
                    setState(() {
                      startDate = date;
                      // Validation: end must be after start
                      if (endDate.isBefore(startDate)) {
                        endDate = startDate.add(const Duration(days: 1));
                      }
                    });
                  },
                  endDateOnChanged: (date) {
                    setState(() {
                      endDate = date;
                    });
                  },
                ),
                Spacer(),
                Center(
                  child: CustomButton(
                    text: 'Create',
                    bgColor: AppColors.secondaryColor,
                    forColor: AppColors.blackColor,
                    width: size.height * 0.3,
                    onpressed: () {
                      saveTask();
                    },
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
