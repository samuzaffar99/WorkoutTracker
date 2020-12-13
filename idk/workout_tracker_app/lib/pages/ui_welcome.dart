import 'package:flutter/material.dart';
//import 'pages/ui_signin.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF89216B), Color(0xFFDA4453)],
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Center(
              child: Text("LOGO"),
              //Insert Logo Here
            ),
            SizedBox(
              height: 250,
            ),
          ]),
        ),
      ),
    );
  }
}
