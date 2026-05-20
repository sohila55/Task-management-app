import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/calender/calender_header_date/date_card.dart';
import 'package:task_manager_app/view_models/cubits/calender_cubit/calender_cubit.dart';

/// ===============================
/// Horizontal date list Widget
/// ===============================
///
/// - Builds a horizontal scrolling list of DateCard widgets
/// - Automatically generates dates starting from TODAY
/// - Uses `index` to move forward day by day
///
class DateList extends StatelessWidget {
  const DateList({super.key, required this.selectedDate});
  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    // Generate date range: 30 days before and 30 days after today
    final today = DateTime.now();
    final startDate = today.subtract(const Duration(days: 30)); // 30 days ago
    final endDate = today.add(const Duration(days: 30)); // 30 days ahead

    // Generate all dates in range
    final dateList = _generateDateRange(startDate, endDate);

    // Find index of today (for initial scroll position)
    // For each date in dateList, it checks:
    /// 1Is this date the same calendar day as today
    final todayIndex = dateList.indexWhere((date) => isSomeDay(date, today));
    return SizedBox(
      height:
          80, // height must be fixed for horizontal ListView to avoid the viewport issue
      child: ListView.separated(
        itemCount: dateList.length,

        scrollDirection: Axis.horizontal,
        controller: ScrollController(initialScrollOffset: todayIndex * 70.0),

        separatorBuilder: (context, index) => const SizedBox(width: 10),

        itemBuilder: (context, index) {
          // Generate date dynamically: today + index days
          // 0 = today, 1 = tomorrow, 2 = day after tomorrow
          final currentDate = dateList[index];
          // selectedDate.add(Duration(days: index));

          final isSelected = isSomeDay(currentDate, selectedDate);
          return DateCard(date: currentDate, isSelected: isSelected);
        },
      ),
    );
  }
}

/// Generate list of dates between start and end (inclusive)
List<DateTime> _generateDateRange(DateTime start, DateTime end) {
  List<DateTime> dates = [];

  DateTime current = DateTime(start.year, start.month, start.day);
  final endDate = DateTime(end.year, end.month, end.day);

  while (current.isBefore(endDate) || current.isAtSameMomentAs(endDate)) {
    dates.add(current);
    current = current.add(const Duration(days: 1));
  }

  return dates;
}
