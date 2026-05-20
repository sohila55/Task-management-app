import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/notification_screen/notification_section.dart';

////////////////////// NotificationBody Section /////////////////////////
///
/// Displays the entire list of notifications in vertical scroll.
/// - Contains multiple `NotificationSection`s (e.g., "New" and "Earlier").
/// - Each section has a title and a list of messages.
/// - `ListView` allows vertical scrolling of all notifications.
class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        NotificationSection(
          title: 'New',
          msg: [
            'Profile Name',
            'Profile Name',
            'Profile Name',
            'Profile Name',
            'Profile Name',
          ],
        ),
        SizedBox(height: 20),
        NotificationSection(
          title: 'Earlier',
          msg: [
            'Profile Name',
            'Profile Name',
            'Profile Name',
            'Profile Name',
            'Profile Name',
          ],
        ),
      ],
    );
  }
}
