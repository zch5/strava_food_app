import 'package:flutter/material.dart';

import '../shared_pages/app_bar_skeleton.dart';

class ChallangesPageView extends StatefulWidget {
  const ChallangesPageView({super.key});
  @override
  _ChallangesPageViewState createState() => _ChallangesPageViewState();
}

class _ChallangesPageViewState extends State<ChallangesPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSkeleton(
        title: 'Challanges',
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}