// "+" button with dashed border (React equivalent)
import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/images.dart';

class AddMemberButton extends StatelessWidget {
  const AddMemberButton({
    super.key,
    required this.onPressed,
    required this.bgColor,
    required this.frColor,
  });

  final VoidCallback onPressed;
  final Color bgColor;
  final Color frColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.rectangle, color: bgColor),
        child: Image.asset(AppImages.addsquareIcon, color: frColor),
      ),
    );
  }
}
