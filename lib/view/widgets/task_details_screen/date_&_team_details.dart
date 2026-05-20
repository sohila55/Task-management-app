import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/avatar_stack.dart';

class RowOfDateAndProjectsTaskDatails extends StatelessWidget {
  const RowOfDateAndProjectsTaskDatails({
    super.key,
    required this.title,

    required this.image,
    this.dayNumber = '',
    this.month = '',
    this.avatarImages = const [],
    this.icon,
  });

  final String title;
  final String dayNumber;
  final String month;
  final Widget image;
  final List<String> avatarImages;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(color: AppColors.secondaryColor),
          child: image,
        ),

        SizedBox(width: size.width * 0.03),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            Text.rich(
              TextSpan(
                text: dayNumber,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: month,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (title == 'Projects Team') AvatarStack(images: avatarImages),
          ],
        ),
      ],
    );
  }
}
