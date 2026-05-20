import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/task_model.dart';

part 'calender_state.dart';

bool isSomeDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());

  Future<void> loadTasksForDate(DateTime date) async {
    try {
      emit(CalenderLoading());

      // Simulate network delay (makes it feel realistic)
      await Future.delayed(Duration(milliseconds: 500));

      // Filter tasks by date (year + month + day)
      final tasksForDate = taskList.where((task) {
        return isSomeDay(task.startDateTime, date);
      }).toList();

      emit(CalenderLoaded(tasks: tasksForDate, selectedDate: date));
    } catch (e) {
      emit(CalenderError(message: e.toString()));
    }
  }

  Future<void> selectDate(DateTime date) async {
    await loadTasksForDate(date);
  }
}
