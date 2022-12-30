import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../routing/router_constants.dart';
import '../shared_pages/app_bar_skeleton.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({super.key});
  @override
  _SettingsPageViewState createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSkeleton(
        title: 'Settings',
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            child: SettingPage(),
          ),
          Container(
            child: ElevatedButton.icon(
              icon: Icon(Icons.logout,),
              label: Text(
                'Sign Out',
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, startRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}