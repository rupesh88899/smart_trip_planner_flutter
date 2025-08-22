
import 'package:smart_trip_planner_flutter_main/services/gemini_service.dart';
import 'package:smart_trip_planner_flutter_main/services/network_service.dart';
import 'package:smart_trip_planner_flutter_main/services/storage_service.dart';
import 'package:smart_trip_planner_flutter_main/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:smart_trip_planner_flutter_main/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:smart_trip_planner_flutter_main/ui/views/followup_itinerarie/followup_itinerarie_view.dart';
import 'package:smart_trip_planner_flutter_main/ui/views/home/home_view.dart';
import 'package:smart_trip_planner_flutter_main/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: FollowupItinerarieView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: GeminiService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: NetworkService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
