import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import '../src/model.dart';
import '../src/api.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class LogPage extends StatefulWidget {
  final User user;
  LogPage(this.user);
  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final Api _api = Api();
  @override
  Widget build(BuildContext context) {
    int index = 3;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: GradientAppBar(
          backgroundColorStart: Color(0xFF1D4350),
          backgroundColorEnd: Color(0xFFa43931),
          elevation:5,
          title: Text("Log"),
          // actions: [
          // //   Padding(
          // //       padding: EdgeInsets.only(right: 20.0),
          // //       child: GestureDetector(
          // //         onTap: () {},
          // //         child: Icon(Icons.dehaze_rounded)
          // //       )
          // //   ),
          // // ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index, widget.user),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFa43931), Color(0xFF1D4350)])),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'No Logs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 300),
              Text(
                '7 Day Streak',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  //Navigator.pop(context);
                  //Insert new navigation page here
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'View last session',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 150.0,
                    child: OutlineButton(
                      onPressed: () {
                        widget.user.log=null;
                        _api.putUser(widget.user);
                        // Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return;
                        //     },
                        //   ),
                        // );
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
                            "Clear Log",
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
        ),
      ),
    );
  }
}
