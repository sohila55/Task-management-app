import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/view/widgets/avatar_stack.dart';

/// ==================== WIDGET DETAILS ====================

/// CompletedTasksDetails: Individual task card inside CompletedTaskSection
/// Shows task title, team members, completion percentage, and progress bar
///
class CompletedTasksDetails extends StatelessWidget {
  const CompletedTasksDetails({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.lineColor,
    required this.title,
    required this.progress,
    required this.teamImages,
    required this.task,
  });

  final Color bgColor;
  final Color textColor;
  final Color lineColor;
  final String title;
  final double progress;
  final List<String> teamImages;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // We wrap the task inside TaskArguments instead of sending it directly.
    // This is to avoid passing raw models directly through routes
    return Container(
      width: size.width * 0.42,
      height: 70,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'Pilat Extended',
                fontStyle: FontStyle.normal,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Team members',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),

                // Right side - Avatar Stack
                AvatarStack(images: teamImages),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Completed',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  '100%',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: lineColor.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation(lineColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
