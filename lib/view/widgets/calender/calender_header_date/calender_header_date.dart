import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/calender/calender_header_date/date_list.dart';

/// ===============================
/// Calendar header section
/// ===============================
///
/// - Combines:
///   1️⃣ Month title
///   2️⃣ Horizontal date list
/// - This widget is used at the top of the Schedule page
///
class CalenderHeaderDate extends StatelessWidget {
  const CalenderHeaderDate({super.key, required this.selectedDate});

  @override
  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    // Extract parts using DateFormat
    final monthName = DateFormat('MMMM').format(selectedDate); // "January"
    final year = DateFormat('yyyy').format(selectedDate); // "2025"

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$monthName $year',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),

        // Horizontal date list
        DateList(selectedDate: selectedDate),
      ],
    );
  }
}

// Helper function (same as in cubit)
bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
