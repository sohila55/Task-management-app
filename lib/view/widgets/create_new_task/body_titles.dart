import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

/// Helper Method

Widget bodyTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: AppColors.whiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );
}
