part of 'ongoing_tasks_section_cubit.dart';

class OngoingTasksSectionState extends Equatable {
  const OngoingTasksSectionState();

  @override
  List<Object> get props => [];
}

class OngoingTasksSectionInitial extends OngoingTasksSectionState {
  const OngoingTasksSectionInitial();
}

class OngoingTasksSectionLoading extends OngoingTasksSectionState {
  const OngoingTasksSectionLoading();
}

class OngoingTasksSectionLoaded extends OngoingTasksSectionState {
  final List<TaskModel> tasks;
  const OngoingTasksSectionLoaded({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class OngoingTasksSectionError extends OngoingTasksSectionState {
  final String message;
  const OngoingTasksSectionError({required this.message});

  @override
  List<Object> get props => [message];
}
