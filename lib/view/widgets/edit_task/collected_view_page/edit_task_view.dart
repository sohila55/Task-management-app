import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/routes/arguments/add_member_argument.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/widgets/custom_appbar.dart';
import 'package:task_manager_app/view/widgets/edit_task/date_section.dart';
import 'package:task_manager_app/view/widgets/edit_task/description_sction.dart';
import 'package:task_manager_app/view/widgets/edit_task/discard_dialog.dart';
import 'package:task_manager_app/view/widgets/edit_task/project_progress.dart';
import 'package:task_manager_app/view/widgets/edit_task/team_member_section.dart';
import 'package:task_manager_app/view/widgets/edit_task/title_section.dart';
import 'package:task_manager_app/view_models/task_details_cubit/task_details_cubit.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required this.task});
  final TaskModel task;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late List<UserModel> selectedMembers;
  // ═══════════════════════════════════════════════════════════
  // SECTION 4: CHANGE TRACKING
  // ═══════════════════════════════════════════════════════════

  bool _isChanged = false;

  Future<void> _addMembers() async {
    final result = await Navigator.pushNamed<List<UserModel>>(
      context,
      AppRoutesName.add_team_members,
      arguments: AddMemberArgument(selectedMembers: selectedMembers),
    );

    if (result != null) {
      setState(() {
        selectedMembers = result;
        _isChanged = true;
      });
    }
  }

  void _removeMembers(UserModel member) {
    setState(() {
      selectedMembers.remove(member);
      _isChanged = true;
    });
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 1: FORM KEY
  // ═══════════════════════════════════════════════════════════
  final _formKey = GlobalKey<FormState>();

  // 🔑 KEY PURPOSE:
  // - Controls ALL TextFormFields inside the Form
  // - Can validate all fields at once: _formKey.currentState!.validate()
  // - Links all TextFormFields together

  // ═══════════════════════════════════════════════════════════
  // SECTION 2: CONTROLLERS
  // ═══════════════════════════════════════════════════════════
  late TextEditingController titleController;

  late TextEditingController descriptionController;
  // 🔑 KEY PURPOSE:
  // - Control text input fields
  // - Get current text: _titleController.text
  // - Set initial text: TextEditingController(text: 'initial')
  // - Listen to changes: _titleController.addListener(...)
  // - MUST dispose: _titleController.dispose()

  // ═══════════════════════════════════════════════════════════
  // SECTION 3: FORM DATE (Non-text fields)
  // ═══════════════════════════════════════════════════════════
  late DateTime startDate;
  late DateTime endDate;
  // 🔑 KEY PURPOSE:
  // - Store non-text form values
  // - Updated via setState when user changes them
  // - Used when saving the task

  // ═══════════════════════════════════════════════════════════
  // SECTION 5: INITIALIZATION
  // ═══════════════════════════════════════════════════════════
  @override
  void initState() {
    super.initState();
    // Initialize controllers with CURRENT task data

    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(
      text: widget.task.description,
    );

    // 🔑 KEY: widget.task is the task passed from EditTaskPage
    // We pre-fill the form with existing data

    // Initialize other fields
    startDate = widget.task.startDateTime;
    endDate = widget.task.endDateTime ?? DateTime.now();

    // Listen for text changes
    titleController.addListener(_onFieldChanged);
    descriptionController.addListener(_onFieldChanged);
    // 🔑 KEY: This marks _isChanges = true when user types

    selectedMembers = List.from(widget.task.assignedMembers);
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 6: CLEANUP
  // ═══════════════════════════════════════════════════════════
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();

    // KEY: ALWAYS dispose controllers to prevent memory leaks!
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 7: CHANGE DETECTION
  // ═══════════════════════════════════════════════════════════
  void _onFieldChanged() {
    if (!_isChanged) {
      setState(() => _isChanged = true);
    }
  }

  // 🔑 KEY: Mark as changed only once (optimization)
  // No need to call setState multiple times

  Future<void> saveTask() async {
    if (!_formKey.currentState!.validate()) {
      //  This checks ALL TextFormField validators
      // If ANY return an error, this is false
      debugPrint(' Validation failed');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fix the errors')));
      return;
    }

    print('✅ Validation passed');
    // Step 2: Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Step 3: Call Cubit to update task

    context.read<TaskDetailsCubit>().editTaskDetails(
      taskId: widget.task.id,
      newTitle: titleController.text.trim(),
      newDescription: descriptionController.text.trim(),
      newStartDateTime: startDate,
      newEndDateTime: endDate,
      newAssignedMembers: selectedMembers,
    );

    // Step 4: Wait for processing
    await Future.delayed(const Duration(milliseconds: 500));

    if (!context.mounted) return;

    // Step 5: Close loading
    Navigator.pop(context);

    // Step 6: Close edit page with SUCCESS result
    Navigator.pop(context, true);
    //  'true' tells TaskDetailsPage that task was updated

    print('✅ Edit complete, navigated back');
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 8: BUILD METHOD
  // ═══════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      /// prevent automatic pop
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // Show confirmation if user made changes
        if (_isChanged) {
          final shouldPop = showDiscardDialog(context);
          if (shouldPop == true && context.mounted) {
            Navigator.pop(context, false);
          } else {
            Navigator.pop(context, false);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: CustomAppbar(
          title: 'Edit Task',
          action: [
            TextButton(
              onPressed: () {
                saveTask();
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        body: Form(
          key: _formKey, //  Links to global form key
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //////////////// Section 1: Title Section ////////////////////
                  TitleSection(
                    title: widget.task.title,
                    titleController: titleController,
                  ),
                  //////////////// Section 2: Description Section ////////////////////
                  DescriptionSction(
                    title: widget.task.description,
                    descriptionController: descriptionController,
                  ),
                  //////////////// Section 3: Project Progress Section ////////////////////
                  ProjectProgress(task: widget.task),
                  SizedBox(height: 20),
                  //////////////// Section 4: Team Member Section ////////////////////
                  TeamMemberSection(
                    selectedMembers: selectedMembers,
                    onAddMember: _addMembers,
                    onDeleteMember: _removeMembers,
                  ),
                  SizedBox(height: 20),
                  ///////////////// Section 5: Date Section //////////////////
                  DateSection(
                    startDate: startDate,
                    endDate: endDate,
                    startDateOnChanged: (newDate) {
                      setState(() {
                        startDate = newDate;
                        _isChanged = true;

                        // Validation: end must be after start
                        if (endDate.isBefore(startDate)) {
                          endDate = startDate.add(const Duration(days: 1));
                        }
                      });
                    },
                    endDateOnChanged: (newDate) {
                      setState(() {
                        endDate = newDate;
                        _isChanged = true;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
