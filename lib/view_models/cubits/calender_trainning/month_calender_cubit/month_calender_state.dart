part of 'month_calender_cubit.dart';

class MonthCalenderState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MonthCalenderInitial extends MonthCalenderState {
  MonthCalenderInitial();
}

final class MonthCalenderLoading extends MonthCalenderState {
  MonthCalenderLoading();
}

final class MonthCalenderLoaded extends MonthCalenderState {
  final DateTime selectedDate;
  final List<EventsModel> tasks;
  MonthCalenderLoaded({required this.selectedDate, required this.tasks});
  @override
  List<Object?> get props => [selectedDate, tasks];
}

final class MonthCalenderError extends MonthCalenderState {
  final String message;
  MonthCalenderError({required this.message});
  @override
  List<Object?> get props => [message];
}
