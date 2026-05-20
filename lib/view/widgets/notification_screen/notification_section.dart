import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/card_message.dart';

//////////////////////// NotificationSection Widget //////////////////////////
///
/// Represents a single section of notifications (e.g., "New" or "Earlier").
/// - `title` is the section heading.
/// - `msg` is a list of messages, each displayed as a `CardMessage`.
/// - Uses a `Column` with `...msg.map` to dynamically generate each message card.
///
class NotificationSection extends StatelessWidget {
  const NotificationSection({
    super.key,
    required this.title,
    required this.msg,
  });

  final String title;
  final List<String> msg;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        ...msg.map((msg) => CardMessage(subTitile: msg)),
      ],
    );
  }
}
