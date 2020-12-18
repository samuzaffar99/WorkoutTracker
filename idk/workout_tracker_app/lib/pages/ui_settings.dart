import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    int index=4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Settings"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {}, child: Icon(Icons.dehaze_rounded))),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index),
        ),
      ),
    );
  }
}
