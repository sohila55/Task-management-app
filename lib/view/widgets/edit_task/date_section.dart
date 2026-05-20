import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/view/widgets/create_new_task/add_time&date_button.dart';
import 'package:task_manager_app/view/widgets/create_new_task/body_titles.dart';
import 'package:task_manager_app/view/widgets/date_picker_selection.dart';

class DateSection extends StatelessWidget {
  const DateSection({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.startDateOnChanged,
    required this.endDateOnChanged,
  });

  ///////////////// data from parent
  final DateTime startDate;
  final DateTime endDate;
  final ValueChanged<DateTime> startDateOnChanged;
  final ValueChanged<DateTime> endDateOnChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyTitle('Start Date & End Date'),
        SizedBox(height: 20),

        // ---------- Time & Date Buttons ----------
        Row(
          children: [
            DateButton(
              ontap: () {
                showStartDatePickerSelection(
                  context,
                  startDate,
                  startDateOnChanged,
                );
              },
              icon: Icons.calendar_today,
              text: DateFormat('yyyy-MM-dd').format(startDate),
            ),
            SizedBox(width: 12),
            DateButton(
              ontap: () {
                showEndDatePickerSelection(
                  context,
                  endDate,
                  startDate,
                  endDateOnChanged,
                );
              },

              icon: Icons.calendar_today,
              text: DateFormat('yyyy-MM-dd').format(endDate),
            ),
          ],
        ),
      ],
    );
  }
}
