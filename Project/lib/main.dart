import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: WelcomeScreen(),
    );
  }
}

enum Genders { Male, Female }


class User {
  Id iId;
  String userID;
  String username;
  String fullName;
  String dateOfBirth;
  String gender;

  User(
      {this.iId,
      this.userID,
      this.username,
      this.fullName,
      this.dateOfBirth,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    userID = json['UserID'];
    username = json['Username'];
    fullName = json['FullName'];
    dateOfBirth = json['DateOfBirth'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['UserID'] = this.userID;
    data['Username'] = this.username;
    data['FullName'] = this.fullName;
    data['DateOfBirth'] = this.dateOfBirth;
    data['Gender'] = this.gender;
    return data;
  }
}

class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}