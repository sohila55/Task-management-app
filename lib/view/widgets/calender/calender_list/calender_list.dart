import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/view/widgets/calender/calender_list/task_card.dart';

/////////////////// Calender List Section///////////////////////
//// A scrollable list of task cards for the calendar view
/// Displays tasks for the selected date
/// Typically placed below the header and title in the calendar page
//////////////////////////////////////////////////////////////////
class CalenderList extends StatelessWidget {
  const CalenderList({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      itemBuilder: (context, index) => TaskCard(
        title: tasks[index].title,
        time: tasks[index].startDateTime.toString().split(' ')[1],
        images: tasks[index].assignedMembers
            .map((member) => member.image)
            .toList(),
      ),
      separatorBuilder: (context, index) =>
          SizedBox(height: size.height * 0.02),
      itemCount: tasks.length,
    );
  }
}


/////////////////////////////////
///
///Rule to memorize (VERY IMPORTANT)

// ❗ A scrollable widget must know how much space it can take

// Scrollable widgets:

// ListView

// GridView

// SingleChildScrollView

// CustomScrollView
///
///Column + ListView = Expanded
///
///
///
///
///
///
///
///