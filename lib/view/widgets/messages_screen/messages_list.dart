import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widgets/card_message.dart';

///////////////////// Messages List Section /////////////////////
///
/// Displays a vertical list of message cards in the Messages page.
/// - Uses `ListView.separated` to create spacing between each message.
/// - Each item is a `CardMessage` showing a profile name (placeholder here).
/// - `itemCount` controls how many messages are shown (currently 5).
/// - The `separatorBuilder` adds consistent spacing between message cards.
class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      itemBuilder: (context, index) => CardMessage(subTitile: 'Profile name'),

      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 5,
    );
  }
}
