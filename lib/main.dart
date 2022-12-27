import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strava_food_app/theme/theme_parent.dart';

import 'firebase_options.dart';

StreamController<bool> isDarkTheme = StreamController();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: isDarkTheme.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Strava Food App',
          theme: ThemeParent().getTheme(snapshot.data!),
          home: Scaffold(
            appBar: AppBar(title: Text('hello')),
            body: SettingPage(),
          )
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
              ElevatedButton(
                  child: Text("Light Theme", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    isDarkTheme.add(false);
                  }),
              ElevatedButton(
                  child: Text("Dark Theme", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    isDarkTheme.add(true);
                  }),
            ])));
  }
}
