import 'package:flutter/material.dart';

import '../../routing/router_constants.dart';
import '../shared_pages/app_bar_skeleton.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});
  @override
  _ProfilePageView createState() => _ProfilePageView();
}

class _ProfilePageView extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSkeleton(
        title: 'You',
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.people),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, settingsRoute);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}