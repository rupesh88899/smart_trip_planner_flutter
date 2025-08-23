import 'package:flutter/material.dart';
import 'package:smart_trip_planner_flutter_main/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'itinerary_viewmodel.dart';

class ItineraryView extends StackedView<ItineraryViewModel> {
  final Map<String, dynamic>? arguments;

  const ItineraryView({super.key, this.arguments});

  @override
  Widget builder(
    BuildContext context,
    ItineraryViewModel viewModel,
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                                color: kcPrimaryColor,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
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
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      viewModel.isLoading || viewModel.isGenerating
                          ? 'Creating Itinerary...'
                          : 'Itinerary Created',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: viewModel.isLoading || viewModel.isGenerating
                        ? _buildLoadingCard(viewModel)
                        : _buildItineraryCard(viewModel),
                  ),
                  const SizedBox(height: 20),
                  _buildActionButtons(viewModel, context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCard(ItineraryViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E8B57)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Creating a perfect plan for you...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildItineraryCard(ItineraryViewModel viewModel) {
    if (viewModel.itinerary == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2196F3), width: 1),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.orange,
              size: 48,
            ),
            const SizedBox(height: 16),
            const Text(
              'Unable to parse itinerary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: SingleChildScrollView(
                child: Text(
                  viewModel.generatedContent,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    final itinerary = viewModel.itinerary!;

    return Container(
      width: double.infinity,
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
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            itinerary.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${itinerary.startDate} to ${itinerary.endDate}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          if (itinerary.days.isNotEmpty) ...[
            Text(
              '${itinerary.days.first.date}: ${itinerary.days.first.summary}',
              style: const TextStyle(
                fontSize: 16,
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
                        width: 6,
                        height: 6,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.time} - ${item.activity}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                height: 1.4,
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
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
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
        ],
      ),
    );
  }

  Widget _buildActionButtons(
      ItineraryViewModel viewModel, BuildContext context) {
    final bool isDisabled = viewModel.isLoading ||
        viewModel.isGenerating ||
        viewModel.itinerary == null;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDisabled
                  ? [
                      kcGradientStart.withOpacity(0.3),
                      kcGradientEnd.withOpacity(0.3)
                    ]
                  : [kcGradientStart, kcGradientEnd],
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
          child: ElevatedButton.icon(
            onPressed:
                isDisabled ? null : () => viewModel.onFollowUpTap(context),
            icon: const Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
              size: 20,
            ),
            label: const Text(
              'Follow up to refine',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 48,
          decoration: null,
          child: ElevatedButton.icon(
            onPressed: isDisabled ? null : viewModel.onSaveOfflineTap,
            icon: const Icon(
              Icons.download,
              color: Colors.black87,
              size: 20,
            ),
            label: const Text(
              'Save Offline',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: isDisabled
                ? ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  )
                : ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black87,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
          ),
        ),
      ],
    );
  }

  @override
  ItineraryViewModel viewModelBuilder(BuildContext context) =>
      ItineraryViewModel(arguments: arguments);
}
