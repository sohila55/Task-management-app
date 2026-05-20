import 'package:flutter/material.dart';
import 'package:task_manager_app/month_Calender_tranning/date_card.dart';
import 'package:task_manager_app/view_models/cubits/calender_cubit/calender_cubit.dart';

class DateCalenderList extends StatelessWidget {
  const DateCalenderList({super.key, required this.selectedDate});
  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final firstDay = today.subtract(Duration(days: today.day - 1));
    final monthDayNumbers = DateTime(
      today.year,
      today.month + 1,
      0,
    ).day; /////// look this tric , (.day) to save just the number of days in the month
    final lastDay = DateTime(
      today.year,
      today.month + 1,
      0,
    ); /////// here ,without (.day) to save the whole date
    List<DateTime> generatedMonthCalender(DateTime first, DateTime last) {
      List<DateTime> dates = [];
      DateTime current = DateTime(first.year, first.month, first.day);
      DateTime end = DateTime(last.year, last.month, last.day);
      while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
        dates.add(current);
        current = current.add(Duration(days: 1));
      }

      return dates;
    }

    final monthDates = generatedMonthCalender(firstDay, lastDay);

    List<DateTime> generatedRangeMonthCalender(DateTime prev, DateTime next) {
      List<DateTime> dates = [];
      DateTime previous = DateTime(prev.year, prev.month, prev.day);
      DateTime Next = DateTime(next.year, next.month, next.day);
      while (prev.isBefore(next) || prev.isAtSameMomentAs(next)) {
        dates.add(prev);
        prev = prev.add(Duration(days: 1));
      }

      return dates;
    }

    final previousMonth = DateTime(today.year, today.month - 1);
    final nextMonth = DateTime(today.year, today.month + 1);

    final rangeMonthDates = generatedRangeMonthCalender(
      previousMonth,
      nextMonth,
    );

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DateCard2(
            date: monthDates[index],
            isSelected: isSomeDay(monthDates[index], selectedDate),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: monthDates.length,
      ),
    );
  }
}
