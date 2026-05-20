import 'package:flutter/material.dart';

class PopupMenuOfSubtasks extends StatelessWidget {
  const PopupMenuOfSubtasks({
    super.key,
    required this.onselected,
    required this.taskId,
    required this.subtaskId,
    required this.child,
  });
  final void Function(String) onselected;
  final String taskId;
  final String subtaskId;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: const EdgeInsets.all(8),

      itemBuilder: (context) {
        return [
          const PopupMenuItem(value: 'Send to Archive', child: Text('Edit')),
          const PopupMenuItem(value: 'Delete', child: Text('Delete')),
        ];
      },
      onSelected: onselected,
      child: child,
    );
  }
}
