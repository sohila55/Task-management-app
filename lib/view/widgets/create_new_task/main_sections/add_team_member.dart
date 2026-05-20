// ===============================
// Add Team Members Section
// ===============================
import 'package:flutter/material.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/create_new_task/add_member_button.dart';
import 'package:task_manager_app/view/widgets/create_new_task/member_avaters.dart';

class AddTeamMembersSection extends StatelessWidget {
  const AddTeamMembersSection({
    super.key,
    required this.onAddMembers,
    required this.selectedMembers,
  });

  /// Callback when the "+" button is pressed
  final VoidCallback onAddMembers;
  final List<UserModel> selectedMembers;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,

      spacing: 12,
      children: [
        // Existing members (mock data like [1,2,3] in React)
        ...List.generate(
          selectedMembers.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: MemberAvatar(img: selectedMembers[index].image),
          ),
        ),

        // "+" Add Member Button
        AddMemberButton(
          bgColor: AppColors.secondaryColor,
          frColor: AppColors.blackColor,
          onPressed: onAddMembers,
        ),
      ],
    );
  }
}
