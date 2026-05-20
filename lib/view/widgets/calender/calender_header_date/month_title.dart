import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/dateTime_helperMethod.dart';

/// ===============================
/// Month title widget
/// ===============================
///
/// - Displays current month name (January, February, ...)
/// - Isolated as a separate widget for cleanliness and reuse
///
///
class MonthTitle extends StatelessWidget {
  const MonthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      monthTitle(DateTime.now().month),
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
