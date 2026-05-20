import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';
import 'package:task_manager_app/view/widgets/card_message.dart';

class NewMessages extends StatelessWidget {
  const NewMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),

        // InkWell(
        //     onTap: () {},
        //     child: ImageIcon(
        //       AssetImage(AppImages.filterIcon),
        //       color: AppColors.whiteColor,
        //       size: 20,
        //     ),
        //   ),
        title: Text(
          'New Messages',
          style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: ImageIcon(
              AssetImage(AppImages.filterIcon),
              color: AppColors.whiteColor,
              size: 20,
            ),
          ),
        ],
      ),

      backgroundColor: AppColors.primaryColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: size.width * 0.03),

              CircleAvatar(
                backgroundColor: AppColors.secondaryColor,
                radius: 25,
                child: Image.asset(AppImages.searchIcon, fit: BoxFit.contain),
              ),
              SizedBox(width: size.width * 0.02),

              InkWell(
                onTap: () {},
                child: Text(
                  'Create Group',
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.02),

          CardMessage(),
          CardMessage(),
        ],
      ),
    );
  }
}
