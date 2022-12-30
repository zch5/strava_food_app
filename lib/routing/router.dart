import 'package:flutter/material.dart';
import 'package:strava_food_app/routing/router_constants.dart';

import '../views/authentication_pages/start_view.dart';
import '../views/settings_pages/settings_page_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startRoute:
        return MaterialPageRoute(builder: (_) => StartView());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPageView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}'),),
          ),
        );
    }
  }
}