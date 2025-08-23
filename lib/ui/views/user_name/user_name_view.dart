import 'package:flutter/material.dart';
import 'package:smart_trip_planner_flutter_main/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'user_name_viewmodel.dart';

class UserNameView extends StackedView<UserNameViewModel> {
  const UserNameView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserNameViewModel viewModel,
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
                gradient: LinearGradient(
                  colors: [
                    kcGradientStart.withOpacity(0.1),
                    kcGradientEnd.withOpacity(0.1),
                  ],
                ),
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
                gradient: LinearGradient(
                  colors: [
                    kcSecondaryColor.withOpacity(0.1),
                    kcAccentColor.withOpacity(0.1),
                  ],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 120.0, left: 25.0, right: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                kcGradientStart.withOpacity(0.2),
                                kcGradientEnd.withOpacity(0.2),
                              ],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: kcPrimaryColor.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.travel_explore,
                            size: 70,
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [kcGradientStart, kcGradientEnd],
                          ).createShader(bounds),
                          child: const Text(
                            'Let\'s Start Your Journey!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Create your personalized travel experience',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: kcSecondaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Card(
                        elevation: 8,
                        shadowColor: kcPrimaryColor.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kcCardColor,
                            border: Border.all(
                              color: kcGradientStart.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [kcGradientStart, kcGradientEnd],
                                ).createShader(bounds),
                                child: const Text(
                                  'Welcome Traveler!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Please tell us your name to continue',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kcSecondaryTextColor,
                                ),
                              ),
                              const SizedBox(height: 24),
                              TextField(
                                controller: viewModel.nameController,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: kcPrimaryTextColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Enter your name',
                                  labelStyle: TextStyle(
                                    color: kcPrimaryColor.withOpacity(0.8),
                                  ),
                                  hintText: 'e.g., John Doe',
                                  hintStyle: TextStyle(
                                    color:
                                        kcSecondaryTextColor.withOpacity(0.5),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: kcPrimaryColor.withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: kcPrimaryColor.withOpacity(0.5),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: kcPrimaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: kcPrimaryColor.withOpacity(0.3),
                                      width: 1.5,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: kcCardColor,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                width: double.infinity,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [kcGradientStart, kcGradientEnd],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kcPrimaryColor.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: viewModel.saveName,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Start Exploring',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 98),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  UserNameViewModel viewModelBuilder(BuildContext context) =>
      UserNameViewModel();
}
