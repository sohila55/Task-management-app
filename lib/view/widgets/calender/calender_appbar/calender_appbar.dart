import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

////////////////// Calender Appbar Widget //////////////////
//// A custom AppBar widget for the Calender screen.
//// This AppBar includes a leading back arrow icon, a centered title,
//// and an action icon for adding new events.
///////////////////////////////////////////////////
class CalenderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CalenderAppbar({super.key});

  @override
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
        'Schedule',
        style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {},
          child: ImageIcon(
            AssetImage(AppImages.addsquareIcon),
            color: AppColors.whiteColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
