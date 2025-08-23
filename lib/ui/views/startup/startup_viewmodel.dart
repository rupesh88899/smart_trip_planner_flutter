import 'package:hive/hive.dart';
import 'package:smart_trip_planner_flutter_main/app/app.locator.dart';
import 'package:smart_trip_planner_flutter_main/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // Check if user name is saved
    final box = await Hive.openBox('userPrefs');
    final userName = box.get('userName');

    if (userName != null) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithUserNameView();
    }
  }
}
