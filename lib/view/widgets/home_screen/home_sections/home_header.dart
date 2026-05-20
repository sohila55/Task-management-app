import 'package:flutter/material.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/colors.dart';

/// ==================== SECTIONS ====================

/// HomeHeader: Top section of the home screen
/// Shows a welcome message and the user's name along with profile avatar
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 16, color: AppColors.secondaryColor),
            ),
            SizedBox(height: 4),
            Text(
              userData[0].name,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor,
                fontFamily: 'Pilat Extended',
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(userData[0].image),
        ),
      ],
    );
  }
}
