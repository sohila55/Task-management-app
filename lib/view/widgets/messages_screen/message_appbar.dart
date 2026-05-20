import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

////////////////////// Message Appbar Section //////////////////////
///// A custom AppBar widget for the Messages screen.
////// This AppBar includes a leading back arrow icon, a centered title,
//////// and an action icon for composing new messages.
////////////////////////////////////////////////////////
class MessageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MessageAppbar({super.key});

  @override
  //// to change appbar height
  ///
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: InkWell(
        onTap: () {},
        child: ImageIcon(
          AssetImage(AppImages.arrowleftIcon),
          color: AppColors.whiteColor,
          size: 20,
        ),
      ),
      title: Text(
        'Messages',
        style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {},
          child: ImageIcon(
            AssetImage(AppImages.editIcon),
            color: AppColors.whiteColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
