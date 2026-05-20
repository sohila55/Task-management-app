import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/images.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.logo, fit: BoxFit.cover);
  }
}
