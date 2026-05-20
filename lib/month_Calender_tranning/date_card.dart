import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/view_models/cubits/calender_trainning/month_calender_cubit/month_calender_cubit.dart';

class DateCard2 extends StatelessWidget {
  const DateCard2({super.key, required this.date, required this.isSelected});
  final DateTime date;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final monthName = DateFormat('MMM').format(date);
    final day = DateFormat('dd').format(date);
    return InkWell(
      onTap: () {
        // Handle date card tap
        context.read<MonthCalenderCubit>().selectDate(date);
      },
      child: Container(
        width: 60,
        height: 80,
        color: isSelected ? Colors.brown : Colors.grey,
        child: Center(
          child: Text.rich(
            TextSpan(
              text: '$day\n',
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: monthName,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
