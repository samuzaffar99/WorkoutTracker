import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import '../src/user.dart';

class Diet extends StatefulWidget {
  final User user;
  Diet(this.user);
  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Diet"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.dehaze_rounded)
                )
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index,widget.user),
        ),
        body: ListView(
          children: [],
        ),
      ),
    );
  }
}
