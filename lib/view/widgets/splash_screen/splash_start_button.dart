import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';
import 'package:task_manager_app/view/widgets/nav_bar.dart';

class SplashStartButton extends StatelessWidget {
  const SplashStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      bgColor: AppColors.secondaryColor,
      forColor: AppColors.blackColor,
      width: double.infinity,
      text: 'Let\'s Start',
      onpressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CustomNavBar()),
        );
      },
    );
  }
}
