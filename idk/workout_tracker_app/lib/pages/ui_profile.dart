import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import 'package:workout_tracker_app/pages/ui_settings.dart';
import '../src/model.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  @override
  ProfilePage(this.user);
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final weightController = TextEditingController();
  final bodyfatController = TextEditingController();
  final weightgController = TextEditingController();
  final bodyfatgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    int index = 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Profile"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {
                      showDialog(context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          title: Text('Edit Profile',
                            style: TextStyle(fontSize: 23),),
                          content: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text('Enter your current weight'),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                TextFormField(
                                  controller: weightController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: '75.0kg',
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Enter your current bodyfat'),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                TextFormField(
                                    controller: bodyfatController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: '15.0 %',
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Enter your desired weight'),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                TextFormField(
                                  controller: weightgController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: '50.0 kg',
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Enter your desired bodyfat'),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                TextFormField(
                                    controller: bodyfatgController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: '10.0 %',
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      minWidth: 100,
                                      height: 50,
                                      color: Colors.grey,
                                      child: Text('Save'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          );
                      });
                    },
                    child: Icon(Icons.edit))),
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
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 52.5,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.user.username} ",
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
              ],
            ),
            Expanded(
              child: Opacity(
                opacity: 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 75,
                              width: 95,
                              child: Card(
                                color: Colors.grey[300],
                                elevation: 4,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "${widget.user.stats.weight} kg\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: "Weight",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 75,
                              width: 95,
                              child: Card(
                                color: Colors.grey[300],
                                elevation: 4,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "15.0 %\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: "BodyFat",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 75,
                              width: 95,
                              child: Card(
                                color: Colors.grey[300],
                                elevation: 4,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "22.0\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: "BMI",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          'Your Goals',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 75,
                              width: 95,
                              child: Card(
                                color: Colors.grey[300],
                                elevation: 4,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "${widget.user.stats.weight} kg\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: "Weight",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 75,
                              width: 95,
                              child: Card(
                                color: Colors.grey[300],
                                elevation: 4,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "15.0 %\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: "BodyFat",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 75,
                              width: 95,
                              child: Card(
                                color: Colors.grey[300],
                                elevation: 4,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "      22\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: "Days Rem",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                          ),
                        ),
                        Text(
                          '7 Day Streak',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
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
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SettingsPage(widget.user);
                                    },
                                  ),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SettingsPage(widget.user);
                                    },
                                  ),
                                );
                              },
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Settings',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
