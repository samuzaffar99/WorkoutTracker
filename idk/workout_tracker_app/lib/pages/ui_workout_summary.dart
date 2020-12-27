import 'package:flutter/material.dart';

class WorkoutSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF141414),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Summary")
            ],
          )
        ],
      ),
    ));
  }
}
