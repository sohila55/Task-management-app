import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/view_models/cubits/calender_trainning/month_calender_cubit/month_calender_cubit.dart';

class ArrowButtons extends StatelessWidget {
  const ArrowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return // In your MonthCalendarScreen
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Previous month button
        IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            context.read<MonthCalenderCubit>().goToPreviousMonth();
          },
        ),

        // Month title
        BlocBuilder<MonthCalenderCubit, MonthCalenderState>(
          builder: (context, state) {
            if (state is MonthCalenderLoaded) {
              final monthYear = DateFormat(
                'MMMM yyyy',
              ).format(state.selectedDate);
              return Text(monthYear); // "January 2025"
            }
            return SizedBox.shrink();
          },
        ),

        // Next month button
        IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: () {
            context.read<MonthCalenderCubit>().goToNextMonth();
          },
        ),
      ],
    );
  }
}
