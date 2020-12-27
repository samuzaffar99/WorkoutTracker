import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
//import '../src/user.dart';
import '../src/model.dart';
import '../src/api.dart';

class SettingsPage extends StatefulWidget {
  final User user;
  final Api _api = Api();
  SettingsPage(this.user);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool toggleDark = false;
  bool toggleAlarm = false;
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Settings"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {}, child: Icon(Icons.dehaze_rounded)),
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index, widget.user),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: Opacity(
                opacity: 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        height: 400,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "   Dark Mode",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Switch(
                                  inactiveThumbColor: Colors.white,
                                  activeTrackColor: Colors.green[10],
                                  activeColor: Colors.green,
                                  value: toggleDark,
                                  onChanged: (value) {
                                    setState(() {
                                      toggleDark = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "   Workout Alarm",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Switch(
                                  inactiveThumbColor: Colors.white,
                                  activeTrackColor: Colors.green[10],
                                  activeColor: Colors.green,
                                  value: toggleAlarm,
                                  onChanged: (value) {
                                    setState(() {
                                      toggleAlarm = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: 'Enter Name',
                                    filled: true,
                                    fillColor: Colors.white.withAlpha(200),

                                  )),
                                ),
                                ElevatedButton(
                                  child: Text('Save'),
                                  onPressed: () {
                                    widget.user.name= nameController.toString();
                                    widget._api.putUser(widget.user);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name: ${widget.user.name}"),
                              ],
                            ),
                            SizedBox(
                              height: 110,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonTheme(
                                  height: 45.0,
                                  minWidth: 150.0,
                                  child: OutlineButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context, 'Sign In');
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    color: Colors.transparent,
                                    textColor: Colors.white,
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.25),
                                    highlightedBorderColor: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Log Out",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Developed by:\nAhmed Khan\nRahim Muhammad\nAbdullah Muzaffar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                //Insert new navigation page here
                              },
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'View on PlayStore',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //Insert new navigation page here
                              },
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Rate Us',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
