// ------------------------
// Bottom Fixed Add Task Button
// ------------------------
import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/custom_button.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.ontap});

  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.1),
      child: SizedBox(
        width: double.infinity,
        height: 70,

        child: CustomButton(
          onpressed: ontap,
          text: 'Add SubTask',
          bgColor: AppColors.secondaryColor,
          forColor: AppColors.blackColor,
        ),
      ),
    );
  }
}
