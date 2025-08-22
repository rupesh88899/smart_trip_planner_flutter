
import 'package:smart_trip_planner_flutter_main/data/models/itinerary_model.dart';
import 'package:smart_trip_planner_flutter_main/services/gemini_service.dart';
class StreamingItineraryProcessor {
  static Stream<String> processWithStreaming({
    required String userPrompt,
    required Itinerary? previousItinerary,
    required List<Map<String, String>> chatHistory,
  }) async* {
    final geminiService = GeminiService();

    await for (String chunk
        in geminiService.generateItineraryWithFunctionCalling(
            userPrompt, previousItinerary, chatHistory)) {
      yield chunk;
    }
  }
}
