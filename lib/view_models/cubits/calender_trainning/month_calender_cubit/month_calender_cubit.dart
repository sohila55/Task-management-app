import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:task_manager_app/models/event_model.dart';

part 'month_calender_state.dart';

class MonthCalenderCubit extends Cubit<MonthCalenderState> {
  MonthCalenderCubit() : super(MonthCalenderInitial());

  void loadTasksForDate(DateTime monthDate) {
    final taskForDate = eventList.where((task) {
      return isSameDay(task.startDate, monthDate);
    }).toList();
    emit(MonthCalenderLoaded(tasks: taskForDate, selectedDate: monthDate));
  }

  void selectDate(DateTime monthDate) {
    loadTasksForDate(monthDate);
  }

  void jumpToToday({required DateTime date}) {
    loadTasksForDate(date);
  }

  void goToPreviousMonth() {
    final currentState = state;

    if (currentState is MonthCalenderLoaded) {
      final currentDate = currentState.selectedDate;
      final previousMonth = DateTime(currentDate.year, currentDate.month - 1);
      jumpToToday(date: previousMonth);
      print(previousMonth);
    }
    final today = DateTime.now();
    final previousMonth = DateTime(today.year, today.month - 1);

    jumpToToday(date: previousMonth);
    print(previousMonth);
  }

  void goToNextMonth() {
    final currentState = state;

    if (currentState is MonthCalenderLoaded) {
      final currentDate = currentState.selectedDate;
      final nextMonth = DateTime(currentDate.year, currentDate.month + 1);
      jumpToToday(date: nextMonth);
      print(nextMonth);
    }
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
