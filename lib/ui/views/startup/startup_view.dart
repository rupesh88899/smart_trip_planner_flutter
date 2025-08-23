import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smart_trip_planner_flutter_main/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Stack(
        children: [
          // Background design elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcPrimaryColor.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcSecondaryColor.withOpacity(0.1),
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo/icon
                Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kcGradientStart.withOpacity(0.2),
                        kcGradientEnd.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.travel_explore,
                    size: 50,
                    color: kcPrimaryColor,
                  ),
                ),
                const SizedBox(height: 40),

                // App name with gradient text
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [kcGradientStart, kcGradientEnd],
                  ).createShader(bounds),
                  child: const Text(
                    'Smart Trip',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your Personal Travel Planner',
                  style: TextStyle(
                    fontSize: 16,
                    color: kcSecondaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),

                // Custom loading indicator
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kcGradientStart.withOpacity(0.2),
                        kcGradientEnd.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
