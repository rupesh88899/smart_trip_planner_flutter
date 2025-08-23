import 'package:flutter/material.dart';
import 'package:smart_trip_planner_flutter_main/data/models/itinerary_model.dart';
import 'package:smart_trip_planner_flutter_main/ui/common/app_colors.dart';
import 'package:smart_trip_planner_flutter_main/ui/views/followup_itinerarie/followup_itinerarie_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FollowupItinerarieView extends StackedView<FollowupItinerarieViewModel> {
  final Map<String, dynamic>? arguments;

  const FollowupItinerarieView({super.key, this.arguments});

  @override
  Widget builder(
    BuildContext context,
    FollowupItinerarieViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Stack(
        children: [
          //background design elements
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
            child: Column(
              children: [
                _buildAppBar(viewModel),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    itemCount: viewModel.chatHistory.length +
                        (viewModel.isThinking ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < viewModel.chatHistory.length) {
                        return _buildChatItem(
                            viewModel.chatHistory[index], viewModel);
                      } else {
                        return _buildThinkingMessage(viewModel);
                      }
                    },
                  ),
                ),
                _buildBottomInputField(viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(FollowupItinerarieViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: kcCardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: kcPrimaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: viewModel.onBackTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kcPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: kcPrimaryColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.tripDescription.length > 30
                      ? '${viewModel.tripDescription.substring(0, 30)}...'
                      : viewModel.tripDescription,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kcPrimaryTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Your Trip Plan',
                  style: TextStyle(
                    fontSize: 13,
                    color: kcSecondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kcGradientStart,
                  kcGradientEnd,
                ],
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
                'S',
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
    );
  }

  Widget _buildChatItem(
      Map<String, dynamic> chatItem, FollowupItinerarieViewModel viewModel) {
    final userMessage = chatItem['user'] as String;
    final aiResponse = chatItem['aiResponse'];

    return Column(
      children: [
        const SizedBox(height: 16),

        // User Message
        _buildUserMessage(userMessage, viewModel),

        const SizedBox(height: 16),

        // AI Response
        if (aiResponse != null) _buildAIResponse(aiResponse, viewModel),
      ],
    );
  }

  Widget _buildUserMessage(
      String message, FollowupItinerarieViewModel viewModel) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'You',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: viewModel.onCopyUserQuery,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.copy, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'Copy',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIResponse(
      dynamic aiResponse, FollowupItinerarieViewModel viewModel) {
    // Check if aiResponse is an Itinerary object
    if (aiResponse is Itinerary) {
      return _buildItineraryResponse(aiResponse, viewModel);
    } else if (aiResponse is String) {
      return _buildTextResponse(aiResponse, viewModel);
    } else {
      return _buildTextResponse('Invalid response format', viewModel);
    }
  }

  Widget _buildItineraryResponse(
      Itinerary itinerary, FollowupItinerarieViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF9800),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Itinera AI',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            itinerary.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${itinerary.startDate} to ${itinerary.endDate}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          if (itinerary.days.isNotEmpty) ...[
            Text(
              '${itinerary.days.first.date}: ${itinerary.days.first.summary}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            ...itinerary.days.first.items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.time} - ${item.activity}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                height: 1.3,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => viewModel
                                  .onOpenMapsTapWithCoordinates(item.location),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Red pushpin icon
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    // Blue underlined text
                                    Text(
                                      'Open in maps',
                                      style: TextStyle(
                                        color: Colors.blue[600],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    // External link icon
                                    Icon(
                                      Icons.open_in_new,
                                      color: Colors.blue[600],
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],

          Divider(
            color: Colors.grey[300],
            height: 1,
          ),
          const SizedBox(height: 16),
          // Action buttons - Copy and Save Offline
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildActionButton(
                icon: Icons.copy,
                label: 'Copy',
                onTap: () => viewModel.onCopyItinerary(),
              ),
              const SizedBox(width: 24),
              if (!viewModel.isReadOnly)
                _buildActionButton(
                  icon: Icons.send,
                  label: 'Save Offline',
                  onTap: () => viewModel.onSaveOffline(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextResponse(
      String response, FollowupItinerarieViewModel viewModel) {
    return Container(
      width: double.infinity,
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
          color: kcGradientEnd.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF9800),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Itinera AI',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            response,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Action buttons - Copy and Save Offline
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildActionButton(
                icon: Icons.copy,
                label: 'Copy',
                onTap: () => viewModel.onCopyItinerary(),
              ),
              const SizedBox(width: 24),
              _buildActionButton(
                icon: Icons.send,
                label: 'Save Offline',
                onTap: () => viewModel.onSaveOffline(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThinkingMessage(FollowupItinerarieViewModel viewModel) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF9800),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Itinera AI',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (viewModel.streamingText.isNotEmpty) ...[
            Text(
              viewModel.streamingText,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 12),
          ],
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                child: const CircularProgressIndicator(
                  color: Color(0xFF4CAF50),
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                viewModel.streamingText.isNotEmpty
                    ? 'Typing...'
                    : 'Thinking...',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomInputField(FollowupItinerarieViewModel viewModel) {
    // Don't show input field in read-only mode
    if (viewModel.isReadOnly) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kcCardColor,
          boxShadow: [
            BoxShadow(
              color: kcPrimaryColor.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, -4),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              color: Colors.grey[600],
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Read Only Mode',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kcCardColor,
        boxShadow: [
          BoxShadow(
            color: kcPrimaryColor.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          // Text Input Field - updated to match design
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: kcPrimaryColor.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: kcPrimaryColor.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: viewModel.followUpController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kcSecondaryTextColor,
                          fontSize: 14,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: kcPrimaryTextColor,
                      ),
                      onSubmitted: (_) => viewModel.onSendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Microphone icon in dark green
                  GestureDetector(
                    onTap: viewModel.onVoiceInputTap,
                    child: const Icon(
                      Icons.mic,
                      color: kcPrimaryColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Send Button - circular with dark green background
          GestureDetector(
            onTap: viewModel.onSendMessage,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kcGradientStart, kcGradientEnd],
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: kcPrimaryColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white, // White icon
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  FollowupItinerarieViewModel viewModelBuilder(BuildContext context) =>
      FollowupItinerarieViewModel(arguments: arguments);
}
