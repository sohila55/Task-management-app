import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/routes/arguments/add_member_argument.dart';
import 'package:task_manager_app/utils/routes/arguments/add_subtask.dart';
import 'package:task_manager_app/utils/routes/arguments/task_arguments.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/pages/features_level-flow/add_team_member.dart';
import 'package:task_manager_app/view/pages/features_level-flow/create_new_subtask.dart';
import 'package:task_manager_app/view/pages/features_level-flow/edit_task.dart';
import 'package:task_manager_app/view/pages/main_app_flow/calender.dart';
import 'package:task_manager_app/view/pages/features_level-flow/create_new_task.dart';
import 'package:task_manager_app/view/pages/main_app_flow/home.dart';
import 'package:task_manager_app/view/pages/main_app_flow/messages.dart';
import 'package:task_manager_app/view/pages/features_level-flow/new_messages.dart';
import 'package:task_manager_app/view/pages/main_app_flow/notifications.dart';
import 'package:task_manager_app/view/pages/app_start_flow/splash.dart';
import 'package:task_manager_app/view/pages/features_level-flow/task_details.dart';

/// A fallback route used when something goes wrong with navigation.
///
/// Instead of crashing the app, we show a simple error screen.
/// This is VERY important in real-world apps.
MaterialPageRoute _errorRoute(String message) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(message)),
    ),
  );
}

/// Generate a route based on the given settings.
///
/// This method returns a MaterialPageRoute that defines a route to a given page.
/// The page is determined by the name field of the settings parameter.
///
/// If the name field does not match any of the predefined routes, a default route is
/// generated that displays a Scaffold with a centered text widget that shows the message
/// "No route defined for ${settings.name}".

class AppRouter {
  /// gnerateRoute is the function that we call it in the main page for => OngenerateRoute
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Define your routes here

      case AppRoutesName.splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case AppRoutesName.navigationBar:
      case AppRoutesName.messages:
        return MaterialPageRoute(builder: (_) => MessagesScreen());
      case AppRoutesName.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutesName.notification:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());

      case AppRoutesName.calender:
        return MaterialPageRoute(builder: (_) => CalenderScreen());
      case AppRoutesName.task_details:

        //////////////////////////////////////
        //
        // Get the arguments sent from Navigator
        final args = settings.arguments;
        // Safety check:
        // - If args is null OR
        // - If args is not TaskArguments
        // Then we show an error screen instead of crashing the app
        if (args == null || args is! TaskArguments) {
          return _errorRoute('Task arguments not found in settings.arguments');
        }
        // Safe access:
        // Now Dart KNOWS args is TaskArguments
        return MaterialPageRoute(
          ////////////////////////
          builder: (_) => TaskDetails(
            task: args.task,
            taskId: args.task.id,
          ), // Passing the correct task dynamically
          fullscreenDialog: true,
        );

      case AppRoutesName.add_new_subtask:
        final args = settings.arguments;
        if (args == null || args is! SubtaskArguments) {
          return _errorRoute('Task arguments not found in settings.arguments');
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.cubit,
            child: CreateNewSubtask(taskId: args.taskId),
          ),
        );
      case AppRoutesName.add_new_task:
        return MaterialPageRoute(builder: (_) => CreateNewTask());
      case AppRoutesName.schedule:
        final args = settings.arguments as TaskArguments;

        return MaterialPageRoute(builder: (_) => CreateNewTask());
      case AppRoutesName.new_message:
        return MaterialPageRoute(builder: (_) => NewMessages());

      case AppRoutesName.add_team_members:
        final args = settings.arguments as AddMemberArgument;

        return MaterialPageRoute<List<UserModel>>(
          builder: (_) => AddTeamMemberPage(
            members: userData,
            selectedMembers: args.selectedMembers,
          ),
        ); // Pass the selected members to the page

      case AppRoutesName.edit_task:
        final args = settings.arguments as TaskArguments;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.cubit!,
            child: EditTask(task: args.task),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
