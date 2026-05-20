// Reusable button for Time & Date
import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    super.key,
    required this.icon,
    required this.text,
    this.ontap,
  });

  final IconData icon;
  final String text;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 25, color: AppColors.secondaryColor),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
