import 'package:joma/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppNavBar extends StatefulWidget {
  @override
  State<MyAppNavBar> createState() => _MyAppNavBarState();
}

class _MyAppNavBarState extends State<MyAppNavBar> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return NavigationBar(
        animationDuration: Duration(seconds: 1),
        onDestinationSelected: (newValue) {
          setState(() {
            appState.navBarSelectedIndex = newValue;
          });
          appState.callNotifyListeners();
        },
        selectedIndex: appState.navBarSelectedIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.all_inbox), label: "all"),
          NavigationDestination(
            icon: Icon(Icons.mark_as_unread),
            label: "unmarked",
          ),
          NavigationDestination(icon: Icon(Icons.done), label: "done")
        ]);
  }
}
