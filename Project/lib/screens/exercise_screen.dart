import 'package:Project/screens/diet_screen.dart';
import 'package:flutter/material.dart';
import 'diet_screen.dart';

class ExerciseScreen extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withAlpha(190),
          child: Icon(Icons.map),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DietScreen();
                },
              ),
            );
          },
        ),
        appBar: AppBar(
          title: Text('<Name>'),
          backgroundColor: Color(0xFF07091c).withAlpha(250),
          actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {},
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF781438), Color(0xFF000000)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      color: Colors.white.withAlpha(190),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0)
                            .copyWith(left: 15, right: 30, top: 25, bottom: 30),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Text(
                                    "Exercise Plan",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
