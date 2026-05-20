import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:task_manager_app/view/widgets/home_screen/home_sections/completed_task_section.dart';
import 'package:task_manager_app/view/widgets/home_screen/home_sections/home_header.dart';
import 'package:task_manager_app/view/widgets/home_screen/home_sections/ongoing_projects_section.dart';
import 'package:task_manager_app/view/widgets/home_screen/home_sections/search_and_filter_bar.dart';
import 'package:task_manager_app/view_models/cubits/completed_tasks_section_cubit/completed_tasks_section_cubit.dart';
import 'package:task_manager_app/view_models/cubits/ongoing_tasks_section_cubit/ongoing_tasks_section_cubit.dart';

/// ==================== MAIN PAGE ====================

/// HomeScreen: The main page of the app.
/// Contains three main sections:
/// 1. HomeHeader (welcome + profile)
/// 2. HomeSearchBar (search + filter button)
/// 3. CompletedTaskSection (horizontal scroll of completed tasks)
/// 4. OngoingProjectsSection (vertical scroll of ongoing projects)
/// The layout handles vertical scroll safely by giving top sections fixed height
/// and bottom section Expanded + SingleChildScrollView.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            SizedBox(height: 16),
            HomeSearchBar(),
            SizedBox(height: 16),

            ////////////////// Completed Task Section ////////////////////
            BlocBuilder<CompletedTasksSectionCubit, CompletedTasksSectionState>(
              bloc: BlocProvider.of<CompletedTasksSectionCubit>(context),
              buildWhen: (previous, current) =>
                  current is CompletedTasksSectionLoaded ||
                  current is CompletedTasksSectionError ||
                  current is CompletedTasksSectionLoading,
              builder: (context, state) {
                if (state is CompletedTasksSectionLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CompletedTasksSectionError) {
                  return Center(child: Text(state.message));
                } else if (state is CompletedTasksSectionLoaded) {
                  // Check if empty
                  if (state.tasks.isEmpty) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          'No completed tasks yet',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }

                  return CompletedTaskSection(tasks: state.tasks);
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    ),
                  );
                }
              },
            ), // horizontal scroll inside fixed height container
            SizedBox(height: 16),

            /////////////////////// Ongoing Projects Section ///////////////////////
            Expanded(
              // takes the remaining space
              child: SingleChildScrollView(
                child: BlocBuilder(
                  bloc: BlocProvider.of<OngoingTasksSectionCubit>(context),
                  buildWhen: (previous, current) =>
                      current is OngoingTasksSectionLoaded ||
                      current is OngoingTasksSectionError ||
                      current is OngoingTasksSectionLoading,

                  builder: (context, state) {
                    if (state is OngoingTasksSectionLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                        ),
                      );
                    } else if (state is OngoingTasksSectionError) {
                      return Center(child: Text(state.message));
                    } else if (state is OngoingTasksSectionLoaded) {
                      // Check if empty
                      if (state.tasks.isEmpty) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Text(
                              'No ongoing projects yet',
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }

                      return OngoingProjectsSection(tasks: state.tasks);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.whiteColor,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
