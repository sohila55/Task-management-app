import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      'Manage\nYour\nTasks With\nDayTask',
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: size.width * 0.09,
        fontWeight: FontWeight.bold,
        fontFamily: 'Pilat Extended',
        height: 1.2,
      ),
    );
  }
}
