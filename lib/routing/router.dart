import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strava_food_app/routing/router_constants.dart';
import 'package:strava_food_app/views/create_pages/create_post_page_view.dart';

import '../viewmodels/create_pages/create_post_page_view_model.dart';
import '../views/authentication_pages/start_view.dart';
import '../views/settings_pages/settings_page_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startRoute:
        return MaterialPageRoute(builder: (_) => StartView());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPageView());
      case createPostRoute:
        //return MaterialPageRoute(builder: (_) => CreatePostPageView());
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<CreatePostPageViewModel>(
            child: CreatePostPageView(),
            create: (_) => CreatePostPageViewModel(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}'),),
          ),
        );
    }
  }
}