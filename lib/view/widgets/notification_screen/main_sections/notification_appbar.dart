import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

class NotificationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppbar({super.key});

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
        'Notifications',
        style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
      ),
      centerTitle: true,
    );
  }
}
