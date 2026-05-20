part of 'task_details_cubit.dart';

class TaskDetailsState extends Equatable {
  const TaskDetailsState();
  @override
  List<Object?> get props => [];
}

final class TaskDetailsInitial extends TaskDetailsState {}

final class TaskDetailsLoaded extends TaskDetailsState {
  final String? lastAction;
  final TaskModel task;
  const TaskDetailsLoaded({required this.task, this.lastAction});

  @override
  List<Object?> get props => [task, lastAction];
}

final class TaskDetailsError extends TaskDetailsState {
  final String message;
  const TaskDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class TaskDetailsLoading extends TaskDetailsState {
  const TaskDetailsLoading();
}

final class TaskDetailsDeleted extends TaskDetailsState {
  const TaskDetailsDeleted();
}
