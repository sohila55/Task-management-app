import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/splash_screen/splash_image_card.dart';
import 'package:task_manager_app/view/widgets/splash_screen/splash_logo.dart';
import 'package:task_manager_app/view/widgets/splash_screen/splash_start_button.dart';
import 'package:task_manager_app/view/widgets/splash_screen/splash_title.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SplashLogo(),

              SizedBox(height: size.height * 0.05),

              SplashImageCard(),
              SizedBox(height: size.height * 0.05),

              SplashTitle(),
              Spacer(),

              SplashStartButton(),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
