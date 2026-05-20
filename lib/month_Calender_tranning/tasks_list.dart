import 'package:flutter/material.dart';
import 'package:task_manager_app/models/event_model.dart';
import 'package:task_manager_app/month_Calender_tranning/tasks_card.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasks});
  final List<EventsModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TasksCard(
          title: tasks[index].title,
          time: tasks[index].startDate.toString().split(' ')[1],
          // images: tasks[index].assignedMembers
          //     .map((member) => member.image)
          //     .toList(),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: tasks.length,
    );
  }
}
