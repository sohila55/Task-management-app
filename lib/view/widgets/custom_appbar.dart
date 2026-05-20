import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.suffixIcon,
    this.action,
  });

  final String title;
  final Widget? suffixIcon;
  final List<Widget>? action;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: ImageIcon(
          AssetImage(AppImages.arrowleftIcon),
          color: AppColors.whiteColor,
          size: 20,
        ),
      ),

      title: Text(
        title,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
      ),
      centerTitle: true,
      elevation: 0.0,
      foregroundColor: AppColors.whiteColor,
      actions: action,
    );
  }
}
