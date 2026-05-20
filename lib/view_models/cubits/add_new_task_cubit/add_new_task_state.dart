part of 'add_new_task_cubit.dart';

class AddNewTaskState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class AddNewTaskInitial extends AddNewTaskState {}

final class AddNewTaskLoading extends AddNewTaskState {
  AddNewTaskLoading();
}

final class AddNewTaskSuccess extends AddNewTaskState {
  AddNewTaskSuccess();
}

final class AddNewTaskError extends AddNewTaskState {
  final String message;
  AddNewTaskError({required this.message});
}
