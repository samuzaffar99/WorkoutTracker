import 'package:flutter/material.dart';
import 'pages/ui_welcome.dart';
import 'package:workout_tracker_app/pages/ui_signup.dart';
import 'package:workout_tracker_app/pages/ui_signin.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Welcome(),
      routes: {
        'Sign Up': (context) => SignUp(),
        'Sign In': (context) => SignIn(),
      },
    );
  }
}
