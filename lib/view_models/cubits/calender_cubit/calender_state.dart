part of 'calender_cubit.dart';

class CalenderState extends Equatable {
  const CalenderState();

  @override
  List<Object> get props => [];
}

class CalenderInitial extends CalenderState {
  const CalenderInitial();
}

class CalenderLoading extends CalenderState {
  const CalenderLoading();
}

class CalenderLoaded extends CalenderState {
  final DateTime selectedDate;
  final List<TaskModel> tasks;
  const CalenderLoaded({required this.tasks, required this.selectedDate});

  @override
  List<Object> get props => [tasks, selectedDate];
}

class CalenderError extends CalenderState {
  final String message;
  const CalenderError({required this.message});

  @override
  List<Object> get props => [message];
}
