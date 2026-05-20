import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

/////////////////////// ListTitle Widget ///////////////////
///
/// Simple widget displaying the section title "Today's Tasks".
/// Uses `listTitleTextStyle` for consistent formatting.
/// Typically placed above the list of tasks in the calendar page.
///
///
/// listTitleTextStyle
///
/// Defines a consistent text style for section titles in the calendar page:
/// - Large, bold, white text for visibility and emphasis.
const TextStyle listTitleTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: AppColors.whiteColor,
);

class ListTitle extends StatelessWidget {
  const ListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Today\'s Tasks', style: listTitleTextStyle);
  }
}
