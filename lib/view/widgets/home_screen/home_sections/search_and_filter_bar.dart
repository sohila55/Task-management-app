import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';

/// ==================== SECTIONS ====================

/// HomeSearchBar: Row with search TextField and filter button

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.bluegrey,
              prefixIcon: Icon(Icons.search, color: AppColors.grey),

              hintText: 'Search',
              hintStyle: TextStyle(color: AppColors.grey),
            ),
          ),
        ),
        SizedBox(width: size.width * 0.04),
        Container(
          width: size.width * 0.12,
          height: size.height * 0.05,
          color: AppColors.secondaryColor,
          child: Center(
            child: Image.asset(AppImages.filterIcon, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
