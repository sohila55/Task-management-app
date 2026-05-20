import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/handle_menu_actions.dart';

class PopupMenuAppbar extends StatelessWidget {
  const PopupMenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.secondaryColor,
      elevation: 0.8,
      padding: const EdgeInsets.all(8),

      enabled: true,

      onSelected: (value) {
        handleMenuActions(context, value);
      },

      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                Icon(Icons.edit, size: 20),
                SizedBox(width: 8),
                Text('Edit Task'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'mark_completed',
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 20),
                SizedBox(width: 8),
                Text('Mark as Completed'),
              ],
            ),
          ),

          PopupMenuItem(
            value: 'mark_in_progress',
            child: Row(
              children: [
                Icon(Icons.play_circle, size: 20),
                SizedBox(width: 8),
                Text('Mark as In Progress'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'mark_pending',
            child: Row(
              children: [
                Icon(Icons.pause_circle, size: 20),
                SizedBox(width: 8),
                Text('Mark as Pending'),
              ],
            ),
          ),

          PopupMenuDivider(),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete, size: 20, color: Colors.red),
                SizedBox(width: 8),
                Text('Delete Task', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ];
      },
    );
  }
}
