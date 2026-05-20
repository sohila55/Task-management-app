import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

class CardMessage extends StatelessWidget {
  const CardMessage({super.key, this.subTitile = ''});
  final String subTitile;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(AppImages.profilePlaceholder),
        radius: 25,
      ),
      title: Text(
        'Profile Name',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),

      subtitle: Text(
        subTitile,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      trailing: Text(
        'date',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
