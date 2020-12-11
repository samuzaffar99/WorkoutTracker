import 'package:Project/screens/ui_signin.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/homenext.jpg"),
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color(0xFF89216B), Color(0xFFDA4453)],
            // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                    "BeFit",
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.white.withAlpha(200),
                      fontWeight: FontWeight.w500,
                        letterSpacing: 1.25,
                    ),
                    ),
                  ),
              SizedBox(height: 250.0),
              Text(
                "Let's get you in shape",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white.withAlpha(220),
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0))
                    ],
                ),
                ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 200.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
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
                          SizedBox(width: 2.0),
                          Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white.withAlpha(230),
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(1.5, 1.5),
                                    blurRadius: 5.0,
                                    color: Color.fromARGB(255, 0, 0, 0))
                              ],
                                ),
                          ),
                          SizedBox(width: 2.0),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
