import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view_models/cubits/calender_cubit/calender_cubit.dart';

/// ===============================
/// Date card widget
/// ===============================
///
/// - Represents ONE day in the calendar row
/// - Receives a DateTime object
/// - Displays:
///   1️⃣ Day number (e.g. 12)
///   2️⃣ Weekday name (Mon, Tue, ...)
///
class DateCard extends StatelessWidget {
  const DateCard({super.key, required this.date, required this.isSelected});

  final DateTime date;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    // Extract parts using DateFormat
    final weekday = DateFormat('EEE').format(date); // "Mon"
    final day = DateFormat('d').format(date); // "15"

    return InkWell(
      onTap: () {
        // Handle date card tap
        context.read<CalenderCubit>().selectDate(date);
      },

      child: Container(
        width: 60,
        height: 80,
        color: isSelected ? AppColors.secondaryColor : AppColors.mediumblack,
        child: Center(
          child: Text.rich(
            TextSpan(
              text: '$day\n',
              style: TextStyle(
                color: isSelected ? AppColors.blackColor : AppColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),

              children: [
                TextSpan(
                  text: weekday,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
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
