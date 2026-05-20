// Small reusable widget for user avatar
import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

class MemberAvatar extends StatelessWidget {
  const MemberAvatar({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkGrey, // bg-secondary
      ),
      child: Image.asset(img),
    );
  }
}
