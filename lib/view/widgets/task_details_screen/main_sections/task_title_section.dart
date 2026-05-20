import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';
import 'package:task_manager_app/view/widgets/task_details_screen/date_&_team_details.dart';

// ------------------------
// Section 1: Project Title + Info Row
// ------------------------
class TaskTitleSection extends StatelessWidget {
  const TaskTitleSection({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        //// Project Title
        Text(
          task.title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            fontFamily: 'Pilat Extended',
            fontStyle: FontStyle.normal,
          ),
        ),

        SizedBox(height: size.height * 0.03),

        // Date & Team Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowOfDateAndProjectsTaskDatails(
              image: Image.asset(AppImages.calenderremoveIcon),
              title: 'Date',
              dayNumber: task.startDateTime.day.toString(),
              month: task.startDateTime.month.toString(),
            ),

            RowOfDateAndProjectsTaskDatails(
              image: Image.asset(AppImages.groupIcon),
              title: 'Projects Team',
              avatarImages: task.assignedMembers
                  .map((member) => member.image)
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}
