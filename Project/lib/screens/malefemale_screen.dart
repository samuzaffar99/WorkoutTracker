import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'registration_screen.dart';

class MaleFemale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("images/mtf.jpg"),
          //   fit: BoxFit.cover,
          // ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF711132), Color(0xFF07091c)],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select your gender",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white.withAlpha(220),
                    fontFamily: "AdobeCleanL",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0))
                    ]),
              ),
              Padding(padding: EdgeInsets.all(80.0).copyWith(bottom: 0)),
              Center(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            ButtonTheme(
                              height: 220.0,
                              minWidth: 220.0,
                              child: Opacity(
                                opacity: 0.6,
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
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/fbutton.png',
                                        height: 246.0,
                                        width: 150.0,
                                      ),
                                    ],
                                  ),
                                  shape: CircleBorder(
                                    // side: BorderSide(
                                    //   width: 3,
                                    //   color: Colors.transparent,
                                    //   //color: Colors.white.withAlpha(200),
                                    // ),
                                  ),
                                  color: Colors.transparent,
                                  //color: Colors.pink.withAlpha(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 175,
                                ),
                                ButtonTheme(
                                  height: 220.0,
                                  minWidth: 220.0,
                                  child: Opacity(
                                    opacity: 0.6,
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
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'images/mbutton.png',
                                            height: 246.0,
                                            width: 189.0,
                                          ),
                                        ],
                                      ),
                                      shape: CircleBorder(
                                        // side: BorderSide(
                                        //   width: 3,
                                        //   color: Colors.transparent,
                                        //   //color: Colors.white.withAlpha(200),
                                        // ),
                                      ),
                                      color: Colors.transparent,
                                      //color: Colors.blue.withAlpha(100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
