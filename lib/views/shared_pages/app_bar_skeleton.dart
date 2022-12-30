import 'package:flutter/material.dart';

class AppBarSkeleton extends StatelessWidget implements PreferredSizeWidget {
  AppBarSkeleton({super.key, required this.title, this.actions, this.tabs, this.onTapTabBar, this.showBackButton = false});
  final String title;
  final List<Widget>? actions;
  final List<Tab>? tabs;
  ValueChanged<int>? onTapTabBar;
  bool showBackButton;

  @override
  Widget build(BuildContext context) {
    if(actions != null) {
      var padding = const Padding(padding: EdgeInsets.all(8.0));
      actions!.insert(0, padding);
      actions!.add(padding);
    }

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shadowColor: Colors.black54,
      elevation: 10.0,
      automaticallyImplyLeading: showBackButton,
      titleSpacing: 8,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
      actions: actions,
      bottom: tabs == null ? null : TabBar(
        onTap: onTapTabBar,
        indicatorColor: Theme.of(context).colorScheme.outline,
        tabs: tabs!,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + (tabs == null ? 0 : const TabBar(tabs: []).preferredSize.height));
}