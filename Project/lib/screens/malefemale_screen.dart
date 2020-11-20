import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'registration_screen.dart';

class MaleFemale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/mtf.jpg"),
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color(0xFFe52165), Color(0xFF0d1137)],
            // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select your gender",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white.withAlpha(220),
                    fontFamily: "AdobeCleanL",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.25,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0))
                    ]),
              ),
              Padding(padding: EdgeInsets.all(38.0).copyWith(bottom: 0)),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 29.0,
                    ),
                    Column(
                      children: [
                        ButtonTheme(
                          height: 146.0,
                          minWidth: 146.0,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegistrationScreen();
                                  },
                                ),
                              );
                            },
                            elevation: 200,
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 3,
                                color: Colors.white.withAlpha(200),
                              ),
                            ),
                            color: Colors.pink.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 97.0,
                        ),
                        ButtonTheme(
                          height: 146.0,
                          minWidth: 146.0,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegistrationScreen();
                                  },
                                ),
                              );
                            },
                            elevation: 200,
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 3,
                                color: Colors.white.withAlpha(200),
                              ),
                            ),
                            color: Colors.blue.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 115.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
