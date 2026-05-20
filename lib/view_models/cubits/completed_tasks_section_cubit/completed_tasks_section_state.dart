part of 'completed_tasks_section_cubit.dart';

class CompletedTasksSectionState extends Equatable {
  const CompletedTasksSectionState();

  @override
  List<Object> get props => [];
}

final class CompletedTasksSectionInitial extends CompletedTasksSectionState {
  const CompletedTasksSectionInitial();
}

final class CompletedTasksSectionLoading extends CompletedTasksSectionState {
  const CompletedTasksSectionLoading();
}

final class CompletedTasksSectionLoaded extends CompletedTasksSectionState {
  final List<TaskModel> tasks;

  const CompletedTasksSectionLoaded({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

final class CompletedTasksSectionError extends CompletedTasksSectionState {
  final String message;
  const CompletedTasksSectionError({required this.message});
}
