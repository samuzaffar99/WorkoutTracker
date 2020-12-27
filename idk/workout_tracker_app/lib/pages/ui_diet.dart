import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
//import '../src/user.dart';
import '../src/model.dart';

class DietPage extends StatefulWidget {
  final User user;
  DietPage(this.user);
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
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
