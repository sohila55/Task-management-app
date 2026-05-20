import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/utils/images.dart';
import 'package:task_manager_app/utils/routes/routes.dart';
import 'package:task_manager_app/view/pages/features_level-flow/new_messages.dart';
import 'package:task_manager_app/view/pages/main_app_flow/calender.dart';
import 'package:task_manager_app/view/pages/main_app_flow/home.dart';
import 'package:task_manager_app/view/pages/main_app_flow/messages.dart';
import 'package:task_manager_app/view/pages/main_app_flow/notifications.dart';
import 'package:task_manager_app/view/widgets/home_screen/home_sections/completed_task_section.dart';
import 'package:task_manager_app/view/widgets/home_screen/home_sections/ongoing_projects_section.dart';
import 'package:task_manager_app/view_models/cubits/completed_tasks_section_cubit/completed_tasks_section_cubit.dart';
import 'package:task_manager_app/view_models/cubits/ongoing_tasks_section_cubit/ongoing_tasks_section_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [
      HomeScreen(),
      MessagesScreen(),
      CalenderScreen(),
      NotificationsScreen(),
    ];

    return PersistentTabView(
      backgroundColor: AppColors.primaryColor,

      tabs: [
        _persistentTabConfig(
          screen: Screens[0],
          icon: ImageIcon(AssetImage(AppImages.homeIcon)),
          title: "Home",
        ),

        _persistentTabConfig(
          screen: Screens[1],
          icon: ImageIcon(AssetImage(AppImages.messagesIcon)),
          title: "Messages",
        ),

        PersistentTabConfig(
          screen: NewMessages(),
          item: ItemConfig(
            icon: GestureDetector(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  AppRoutesName.add_new_task,
                );
                if (result == true && context.mounted) {
                  context
                      .read<CompletedTasksSectionCubit>()
                      .loadCompletedTasks();
                  context
                      .read<OngoingTasksSectionCubit>()
                      .refreshOngoingTasks();
                }
              },
              child: ImageIcon(AssetImage(AppImages.addsquareIcon)),
            ),
            title: "Add",
            activeForegroundColor: AppColors.secondaryColor,
            inactiveForegroundColor: AppColors.grey,
          ),

          navigatorConfig: NavigatorConfig(),
        ),
        _persistentTabConfig(
          screen: Screens[2],
          icon: ImageIcon(AssetImage(AppImages.calenderIcon)),
          title: "Calender",
        ),
        _persistentTabConfig(
          screen: Screens[3],
          icon: ImageIcon(AssetImage(AppImages.notificationIcon)),
          title: "Notifications",
        ),
      ],

      // navBarOverlap: NavBarOverlap.custom(),
      navBarBuilder: (navBarConfig) => Style16BottomNavBar(
        navBarDecoration: NavBarDecoration(
          color: AppColors.mediumblack,
          shape: BoxShape.rectangle,
        ),
        height: 80,

        navBarConfig: navBarConfig,
      ),
    );
  }
}

PersistentTabConfig _persistentTabConfig({
  required Widget screen,
  required Widget icon,
  required String title,
}) {
  return PersistentTabConfig(
    screen: screen,
    item: ItemConfig(
      icon: icon,
      title: title,
      activeForegroundColor: AppColors.secondaryColor,
      inactiveForegroundColor: AppColors.grey,
    ),
  );
}
