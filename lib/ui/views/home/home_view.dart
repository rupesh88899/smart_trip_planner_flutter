import 'package:flutter/material.dart';
import 'package:smart_trip_planner_flutter_main/data/models/saved_conversation.dart';
import 'package:smart_trip_planner_flutter_main/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      resizeToAvoidBottomInset: true,
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
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hey ${viewModel.userName}!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kcPrimaryColor,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [kcGradientStart, kcGradientEnd],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: kcPrimaryColor.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'R',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        "What's your vision for this trip?",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: kcCardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: kcPrimaryColor.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                        border: Border.all(
                          color: kcGradientStart.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: viewModel.tripDescriptionController,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: 'Describe your dream trip...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: viewModel.onVoiceInputTap,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.mic,
                                    color: kcPrimaryColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [kcGradientStart, kcGradientEnd],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: viewModel.onCreateItineraryTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Create My Itinerary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Offline Saved Itineraries',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () => viewModel.refreshConversations(),
                          child: Icon(
                            Icons.refresh,
                            color: kcPrimaryColor,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 250,
                      child: viewModel.isBusy
                          ? const Center(child: CircularProgressIndicator())
                          : viewModel.savedConversations.isEmpty
                              ? _buildEmptyState()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      viewModel.savedConversations.length,
                                  itemBuilder: (context, index) {
                                    final conversation =
                                        viewModel.savedConversations[index];
                                    return _buildSavedItineraryCard(
                                        conversation, viewModel);
                                  },
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open_outlined,
            size: 64,
            color: kcSecondaryTextColor,
          ),
          const SizedBox(height: 16),
          Text(
            'No saved itineraries yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first itinerary to see it here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSavedItineraryCard(
      SavedConversation conversation, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.onViewConversation(conversation),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kcCardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: kcPrimaryColor.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: kcGradientStart.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF2E8B57),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                conversation.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  height: 1.3,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Delete',
              onPressed: () {
                viewModel.onDeleteConversation(conversation.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
