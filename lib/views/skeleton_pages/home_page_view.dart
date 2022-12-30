import 'package:flutter/material.dart';

import '../shared_pages/app_bar_skeleton.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSkeleton(
        title: 'Home',
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.people),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}