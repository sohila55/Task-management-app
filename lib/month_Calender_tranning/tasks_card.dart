import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({
    super.key,
    required this.title,
    required this.time,
    this.images,
  });
  final String title;
  final String time;
  final List<String>? images;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      color: AppColors.mediumblack,

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),

            // AvatarStack(images: images),
          ],
        ),
      ),
    );
  }
}
