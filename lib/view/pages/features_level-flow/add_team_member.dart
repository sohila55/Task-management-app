import 'package:flutter/material.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';
import 'package:task_manager_app/view/widgets/custom_appbar.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';

class AddTeamMemberPage extends StatefulWidget {
  const AddTeamMemberPage({
    super.key,
    required this.members,
    required this.selectedMembers,
  });

  final List<UserModel> members;

  final List<UserModel> selectedMembers;
  @override
  State<AddTeamMemberPage> createState() => _AddTeamMemberPageState();
}

class _AddTeamMemberPageState extends State<AddTeamMemberPage> {
  // ═══════════════════════════════════════════════════════════
  // STATE: Temporary selection (changes as user checks/unchecks)
  // ═══════════════════════════════════════════════════════════
  late List<UserModel> tempSelection;

  @override
  void initState() {
    super.initState();
    // Make a COPY of currently selected users
    // Why copy? So we don't modify the original until "Done" is pressed
    tempSelection = List.from(widget.selectedMembers);
  }

  // ═══════════════════════════════════════════════════════════
  // TOGGLE USER: Add or remove from selection
  // ═══════════════════════════════════════════════════════════

  void _toggleUser(UserModel user) {
    setState(() {
      if (tempSelection.contains(user)) {
        tempSelection.remove(user);
        print(' Removed user${user.name}');
      } else {
        tempSelection.add(user);
        print('Added user + ${user.name}');
      }

      print('   Total selected: ${tempSelection.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Add Members to a Task'),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              enabled: true,
              hintStyle: WidgetStateProperty.all(
                TextStyle(color: AppColors.darkGrey),
              ),
              leading: Image.asset(
                AppImages.searchIcon,
                color: AppColors.darkGrey,
              ),
              hintText: 'Search Members',
              backgroundColor: WidgetStateProperty.all(
                AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: 16),
            /////////////////////////////////////////////////////////////
            //////////////////////// Users List //////////////////////////
            /// /////////////////////////////////////////////
            Expanded(
              child: ListView.builder(
                itemCount: widget.members.length,

                itemBuilder: (context, index) {
                  final user = widget.members[index];
                  // Check if this user is selected

                  final isSelected = tempSelection.contains(user);
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.darkblue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: AppColors.secondaryColor,
                            checkColor: AppColors.blackColor,
                            shape: CircleBorder(),

                            visualDensity: VisualDensity.compact,

                            value: isSelected,
                            onChanged: (bool? value) {
                              _toggleUser(user);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(
                              label: Text(user.name[0].toUpperCase()),
                              autofocus: true,
                              backgroundColor: AppColors.darkblue,
                              elevation: 8.0,
                              shape: CircleBorder(side: BorderSide.none),
                              visualDensity: VisualDensity.comfortable,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                user.name,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            /////////////// Done Button ////////////////////////
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomButton(
                text: 'Done (${tempSelection.length} Selected)',
                width: double.infinity,
                onpressed: () {
                  Navigator.pop(context, tempSelection);
                },
                bgColor: AppColors.secondaryColor,
                forColor: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
