import 'package:flutter/material.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';
import 'package:task_manager_app/view/widgets/create_new_task/body_titles.dart';
import 'package:task_manager_app/view/widgets/create_new_task/member_avaters.dart';

class TeamMemberSection extends StatelessWidget {
  const TeamMemberSection({
    super.key,
    required this.selectedMembers,
    required this.onAddMember,
    required this.onDeleteMember,
  });
  final List<UserModel> selectedMembers;
  final VoidCallback onAddMember;
  final Function(UserModel) onDeleteMember;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bodyTitle('Team Members'),

              SizedBox(height: size.height * 0.02),

              ////////////// note ////////////////
              /// wrap widget need a needs a known maximum width to
              ///  know when to wrap to the next line.
              Wrap(
                spacing: 10,
                runSpacing: 10.0,
                alignment: WrapAlignment.start,
                children: [
                  if (selectedMembers.isEmpty)
                    // Show this if no members selected
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.mediumblack,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.whiteColor.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: AppColors.whiteColor.withOpacity(0.5),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'No members assigned',
                            style: TextStyle(
                              color: AppColors.whiteColor.withOpacity(0.5),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    // Show this if members are selected
                    ...List.generate(
                      selectedMembers.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputChip(
                          onDeleted: () {
                            print(
                              '➖ Removing member: ${selectedMembers[index].name}',
                            );
                            onDeleteMember(selectedMembers[index]);
                          },

                          avatar: MemberAvatar(
                            img: AppImages.profilePlaceholder,
                          ),
                          backgroundColor: AppColors.darkGrey,
                          deleteIcon: Image.asset(
                            AppImages.closesquareIcon,
                            color: AppColors.whiteColor,
                          ),
                          label: Text(
                            selectedMembers[index].name,
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ),

                  // "+" Add Member Button
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ActionChip(
                      label: Image.asset(
                        AppImages.addsquareIcon,
                        color: AppColors.blackColor,
                      ),
                      backgroundColor: AppColors.secondaryColor,
                      onPressed: onAddMember,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
