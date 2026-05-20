import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';

///////////////////////// MessagesTabs Section/////////////////////////
///
/// Displays the top tabs in the Messages page: "Chat" and "Groups".
/// - Uses a horizontal `Row` to place two `CustomButton`s side by side.
/// - Buttons take a percentage of screen width for responsive sizing.
/// - Each button has its own background and text color for active/inactive states.
/// - `SizedBox` adds vertical spacing (can be adjusted if needed).
class MessagesTabs extends StatelessWidget {
  const MessagesTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButton(
          text: 'Chat',
          width: size.width * 0.4,
          bgColor: AppColors.grey,
          forColor: AppColors.whiteColor,
          onpressed: () {},
        ),
        SizedBox(height: size.height * 0.02),
        CustomButton(
          text: 'Groups',
          width: size.width * 0.4,
          bgColor: AppColors.secondaryColor,
          forColor: AppColors.blackColor,
          onpressed: () {},
        ),
      ],
    );
  }
}
