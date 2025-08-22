
import 'package:smart_trip_planner_flutter_main/data/models/chat_message.dart';
import 'package:smart_trip_planner_flutter_main/data/models/itinerary_model.dart';
import 'package:smart_trip_planner_flutter_main/data/models/saved_conversation.dart';

abstract class ConversationRepository {
  Future<void> saveConversation(SavedConversation conversation);

  Future<List<SavedConversation>> getAllConversations();

  Future<SavedConversation?> getConversationById(String id);

  Future<void> updateConversation(SavedConversation conversation);

  Future<void> deleteConversation(String id);

  Future<List<SavedConversation>> searchConversations(String query);

  Future<List<SavedConversation>> getRecentConversations();

  Future<void> addMessageToConversation(
      String conversationId, ChatMessage message);

  Future<void> updateConversationItinerary(
      String conversationId, Itinerary itinerary);
}
