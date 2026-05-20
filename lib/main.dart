import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/utils/routes/app_router.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view_models/cubits/add_new_task_cubit/add_new_task_cubit.dart';
import 'package:task_manager_app/view_models/cubits/calender_cubit/calender_cubit.dart';
import 'package:task_manager_app/view_models/cubits/completed_tasks_section_cubit/completed_tasks_section_cubit.dart';
import 'package:task_manager_app/view_models/cubits/ongoing_tasks_section_cubit/ongoing_tasks_section_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompletedTasksSectionCubit()
            ..loadCompletedTasks()
            ..refreshCompletedTasks(),
        ),
        BlocProvider(
          create: (context) => OngoingTasksSectionCubit()
            ..loadOngoingTasks()
            ..refreshOngoingTasks(),
        ),

        BlocProvider(
          create: (context) =>
              CalenderCubit()..loadTasksForDate(DateTime.now()),
        ),
        BlocProvider(create: (context) => AddNewTaskCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Task Manager App',
        initialRoute: AppRoutesName.splash,
        onGenerateRoute: AppRouter.generateRoute,

        theme: ThemeData(primaryColor: AppColors.primaryColor),
      ),
    );
  }
}
