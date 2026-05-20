// ===============================
// Time & Date Section
// ===============================
import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/create_new_task/add_time&date_button.dart';

class TimeAndDateSection extends StatelessWidget {
  const TimeAndDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- Time & Date Buttons ----------
        Row(
          children: [
            Expanded(
              child: DateButton(
                ontap: () {},
                icon: Icons.access_time,
                text: '10:10 AM',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: DateButton(
                ontap: () {},

                icon: Icons.calendar_today,
                text: '10/11/2022',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
