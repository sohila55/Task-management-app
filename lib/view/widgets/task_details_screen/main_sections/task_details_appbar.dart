import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/custom_appbar.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/popup_menu_appbar.dart';

class TaskDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TaskDetailsAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return CustomAppbar(title: 'Task Details', action: [PopupMenuAppbar()]);
  }
}
