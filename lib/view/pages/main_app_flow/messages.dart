import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/messages_screen/message_appbar.dart';
import 'package:task_manager_app/view/widgets/messages_screen/messages_list.dart';
import 'package:task_manager_app/view/widgets/messages_screen/messages_start_button.dart';
import 'package:task_manager_app/view/widgets/messages_screen/messages_tabs.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      appBar: const MessageAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),

            MessagesTabs(),

            SizedBox(height: 16),

            Expanded(child: MessagesList()),
            SizedBox(height: 16),

            MessagesStartButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
