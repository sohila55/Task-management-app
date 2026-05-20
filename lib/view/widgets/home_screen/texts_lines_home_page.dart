import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

/// ==================== WIDGET DETAILS ====================

/// TextsLinesHomePage: Row showing a title and a "See All" text for sections
/// Used in CompletedTaskSection and OngoingProjectsSection
///
class TextsLinesHomePage extends StatelessWidget {
  const TextsLinesHomePage({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  final String leftText;
  final String rightText;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: size.width * 0.05,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: size.width * 0.04,
          ),
        ),
      ],
    );
  }
}
