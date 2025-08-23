// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:smart_trip_planner_flutter_main/ui/views/followup_itinerarie/followup_itinerarie_view.dart'
    as _i4;
import 'package:smart_trip_planner_flutter_main/ui/views/home/home_view.dart'
    as _i2;
import 'package:smart_trip_planner_flutter_main/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:smart_trip_planner_flutter_main/ui/views/user_name/user_name_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const followupItinerarieView = '/followup-itinerarie-view';

  static const userNameView = '/user-name-view';

  static const all = <String>{
    homeView,
    startupView,
    followupItinerarieView,
    userNameView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.followupItinerarieView,
      page: _i4.FollowupItinerarieView,
    ),
    _i1.RouteDef(
      Routes.userNameView,
      page: _i7.UserNameView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.FollowupItinerarieView: (data) {
      final args = data.getArgs<FollowupItinerarieViewArguments>(
        orElse: () => const FollowupItinerarieViewArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.FollowupItinerarieView(
            key: args.key, arguments: args.arguments),
        settings: data,
      );
    },
    _i7.UserNameView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.UserNameView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class FollowupItinerarieViewArguments {
  const FollowupItinerarieViewArguments({
    this.key,
    this.arguments,
  });

  final _i5.Key? key;

  final Map<String, dynamic>? arguments;

  @override
  String toString() {
    return '{"key": "$key", "arguments": "$arguments"}';
  }

  @override
  bool operator ==(covariant FollowupItinerarieViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.arguments == arguments;
  }

  @override
  int get hashCode {
    return key.hashCode ^ arguments.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFollowupItinerarieView({
    _i5.Key? key,
    Map<String, dynamic>? arguments,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.followupItinerarieView,
        arguments:
            FollowupItinerarieViewArguments(key: key, arguments: arguments),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFollowupItinerarieView({
    _i5.Key? key,
    Map<String, dynamic>? arguments,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.followupItinerarieView,
        arguments:
            FollowupItinerarieViewArguments(key: key, arguments: arguments),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
