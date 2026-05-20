import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/notification_screen/main_sections/notification_appbar.dart';
import 'package:task_manager_app/view/widgets/notification_screen/main_sections/notification_body.dart';

//////////////// Notifications Main Screen ////////////////
//// The main screen for displaying notifications.
//// - Uses a `Scaffold` with an `AppBar` and a `NotificationBody` as its body.
///////////////////////////////////////////////////
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const NotificationAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: const NotificationBody(),
      ),
    );
  }
}
