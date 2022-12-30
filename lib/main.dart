import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strava_food_app/routing/router.dart' as local_router;
import 'package:strava_food_app/routing/router_constants.dart';
import 'package:strava_food_app/theme/theme_parent.dart';
import 'package:strava_food_app/views/utilities.dart';

import 'firebase_options.dart';

StreamController<bool> isDarkTheme = StreamController();
bool _isDarkMode = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: isDarkTheme.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          scaffoldMessengerKey: Utilities.messengerKey,
          navigatorKey: navigatorKey,
          title: 'Strava Food App',
          theme: ThemeParent().getTheme(snapshot.data!),
          onGenerateRoute: local_router.Router.generateRoute,
          initialRoute: startRoute,
        );
      },
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                  onPressed: () {
                    _isDarkMode = !_isDarkMode;
                    isDarkTheme.add(_isDarkMode);
                  },
                  icon: _isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode)
              ),
              // ElevatedButton(
              //     child: Text("Light Theme"),
              //     onPressed: () {
              //       isDarkTheme.add(false);
              //     }),
              // ElevatedButton(
              //     child: Text("Dark Theme"),
              //     onPressed: () {
              //       isDarkTheme.add(true);
              //     }),
            ]),
        ),
    );
  }
}
