import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/routes/arguments/task_arguments.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/widgets/home_screen/projects_card.dart';
import 'package:task_manager_app/view/widgets/home_screen/texts_lines_home_page.dart';

/// ==================== SECTIONS ====================

/// OngoingProjectsSection: Vertical scrollable list of ongoing projects
/// Each project is displayed as a ProjectCard with title, due date, team members, and progress
class OngoingProjectsSection extends StatelessWidget {
  const OngoingProjectsSection({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TextsLinesHomePage(leftText: 'Ongoing Projects', rightText: 'See All'),

        ListView.separated(
          shrinkWrap: true,

          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(
              AppRoutesName.task_details,
              arguments: TaskArguments(task: tasks[index]),
            ),
            child: ProjectCard(
              title: tasks[index].title,
              date: tasks[index].endDateTime.toString().split(' ')[0],

              progressPercent: tasks[index].progress,
              teamImage: tasks[index].assignedMembers
                  .map((member) => member.image)
                  .toList(),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: size.height * 0.02);
          },
          itemCount: tasks.length,
        ),
      ],
    );
  }
}
