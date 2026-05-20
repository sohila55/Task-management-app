import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

Future<void> showStartDatePickerSelection(
  BuildContext context,
  DateTime startDate,
  ValueChanged<DateTime> startDateOnChanged,
) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: startDate, // Show current date selected
    firstDate: DateTime(2020), // Earliest selectable date
    lastDate: DateTime(2030), // Latest selectable date
    // step 2 : style the picker to match the app theme
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.secondaryColor, // Selected date color
            onPrimary: AppColors.blackColor, // Text on selected date
            surface: AppColors.mediumblack, // Dialog background
            onSurface: AppColors.whiteColor, // Text color
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    startDateOnChanged(pickedDate);
  }
}

Future<void> showEndDatePickerSelection(
  BuildContext context,
  DateTime endDate,
  DateTime startDate,
  ValueChanged<DateTime> endDateOnChanged,
) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: endDate, // Show current date selected
    firstDate: startDate, // Earliest selectable date
    lastDate: DateTime(2030), // Latest selectable date
    // step 2 : style the picker to match the app theme
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.secondaryColor, // Selected date color
            onPrimary: AppColors.blackColor, // Text on selected date
            surface: AppColors.mediumblack, // Dialog background
            onSurface: AppColors.whiteColor, // Text color
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    endDateOnChanged(pickedDate);
  }
}
