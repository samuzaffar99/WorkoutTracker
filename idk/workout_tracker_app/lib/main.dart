import 'package:flutter/material.dart';
import 'pages/ui_welcome.dart';
import 'package:workout_tracker_app/pages/ui_signup.dart';
import 'package:workout_tracker_app/pages/ui_signin.dart';
import 'package:workout_tracker_app/pages/ui_home.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: WelcomePage(),
      routes: {
        'Sign Up': (context) => SignUpPage(),
        'Sign In': (context) => SignInPage(),
        'Home': (context) => HomePage(),
      },
    );
  }
}
