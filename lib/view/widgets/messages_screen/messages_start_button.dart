import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';

////////////////////////// MessagesStartButton Widget //////////////////////////
/// A custom button for starting a new chat in the Messages screen.
/// Typically placed at the bottom of the screen.
///
class MessagesStartButton extends StatelessWidget {
  const MessagesStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomButton(
      text: 'Start Chat',
      bgColor: AppColors.secondaryColor,
      forColor: AppColors.blackColor,
      width: size.width * 0.4,
      onpressed: () {},
    );
  }
}
