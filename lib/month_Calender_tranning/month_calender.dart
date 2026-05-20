import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/month_Calender_tranning/arrow_buttons.dart';
import 'package:task_manager_app/month_Calender_tranning/date_calender_list.dart';
import 'package:task_manager_app/month_Calender_tranning/tasks_list.dart';
import 'package:task_manager_app/view/widgets/calender/calender_appbar/calender_appbar.dart';
import 'package:task_manager_app/view_models/cubits/calender_trainning/month_calender_cubit/month_calender_cubit.dart';

class MonthCalenderPage extends StatelessWidget {
  const MonthCalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalenderAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MonthCalenderCubit, MonthCalenderState>(
          bloc: BlocProvider.of<MonthCalenderCubit>(context),
          buildWhen: (previous, current) =>
              current is MonthCalenderLoaded ||
              current is MonthCalenderError ||
              current is MonthCalenderLoading,
          builder: (context, state) {
            if (state is MonthCalenderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MonthCalenderError) {
              return Center(child: Text(state.message));
            } else if (state is MonthCalenderLoaded) {
              return Column(
                children: [
                  DateCalenderList(selectedDate: state.selectedDate),
                  SizedBox(height: 10),

                  ArrowButtons(),

                  Expanded(child: TasksList(tasks: state.tasks)),
                ],
              );
            } else {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              );
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<MonthCalenderCubit>(
            context,
          ).jumpToToday(date: DateTime.now());
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.join_right_rounded, color: Colors.white, size: 30),
      ),
    );
  }
}
