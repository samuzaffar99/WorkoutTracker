import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_signin.dart';

class SetupComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xFF141414),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 260,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Congratulations!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 0, 0, 0))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'You''re all set up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 0, 0, 0))
              ],
            ),
          ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                height: 45.0,
                minWidth: 200.0,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/ui_signin'));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        },),);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.transparent,
                  textColor: Colors.white,
                  borderSide: BorderSide(
                      color: Colors.white.withAlpha(200), width: 1.25),
                  highlightedBorderColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nice!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withAlpha(230),
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 0, 0, 0))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),);
  }
}
