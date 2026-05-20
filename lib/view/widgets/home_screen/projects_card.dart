import 'package:flutter/material.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/avatar_stack.dart';

/// ==================== WIDGET DETAILS ====================

/// ProjectCard: Individual project card inside OngoingProjectsSection
/// Displays title, due date, team members, and progress circle
class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.date,
    required this.progressPercent,
    required this.teamImage,
  });

  final String title;
  final String date;
  final double progressPercent;
  final List<String> teamImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontFamily: 'Pilat Extended',
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(height: 12),

          // Team + due date + progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: team members + due date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Team members',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),

                  AvatarStack(images: teamImage),
                  Row(
                    children: [
                      const Text(
                        'Duo on :',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        date,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Right: progress indicator
              PercentCircleIndicator(
                percent: progressPercent,
                radius: 28,
                strokeWidth: 2,
                backgroundColor: AppColors.secondaryColor,
                progress: AppColors.lightblack,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                animated: true,
                duration: const Duration(seconds: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
