import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smart_trip_planner_flutter_main/app/app.locator.dart';
import 'package:smart_trip_planner_flutter_main/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserNameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final nameController = TextEditingController();

  Future<void> saveName() async {
    final name = nameController.text.trim();
    if (name.isEmpty) return;

    // Save to Hive
    final box = await Hive.openBox('userPrefs');
    await box.put('userName', name);

    // Navigate to home
    _navigationService.replaceWithHomeView();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
