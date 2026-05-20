import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/calender/calender_appbar/calender_appbar.dart';
import 'package:task_manager_app/view/widgets/calender/calender_header_date/calender_header_date.dart';
import 'package:task_manager_app/view/widgets/calender/calender_list/calender_list.dart';
import 'package:task_manager_app/view_models/cubits/calender_cubit/calender_cubit.dart';

/// CalenderScreen
///
/// Main calendar page displaying:
/// 1. Calendar header with current month and horizontal date selector.
/// 2. Title for task section.
/// 3. Scrollable list of tasks for the selected date.
///
/// Layout notes:
/// - Padding adds spacing around content.
/// - Column arranges header, title, and task list vertically.
/// - Expanded ensures task list fills remaining space and scrolls vertically.

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      appBar: const CalenderAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: BlocBuilder<CalenderCubit, CalenderState>(
          bloc: BlocProvider.of<CalenderCubit>(context),
          buildWhen: (previous, current) =>
              current is CalenderLoaded ||
              current is CalenderLoading ||
              current is CalenderError,
          builder: (context, state) {
            if (state is CalenderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CalenderError) {
              return Center(child: Text(state.message));
            } else if (state is CalenderLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CalenderHeaderDate(selectedDate: state.selectedDate),

                  SizedBox(height: size.height * 0.04),

                  Expanded(child: CalenderList(tasks: state.tasks)),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
