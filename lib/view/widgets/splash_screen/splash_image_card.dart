import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

class SplashImageCard extends StatelessWidget {
  const SplashImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      width: size.width * 0.85,
      height: size.height * 0.4,
      color: AppColors.whiteColor,

      child: Center(child: Image.asset(AppImages.splash, fit: BoxFit.contain)),
    );
  }
}
