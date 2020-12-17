import 'package:flutter/material.dart';
import 'src/api.dart';
import 'src/model.dart';

class UserDetails
{
  final Api _api = Api();
  Driver drivers;
  String username;
  // String password;
  // String email;
  String gender;
  String weight;
  String height;
  String date;

  UserDetails({this.username});

  setUserDetails() async
  {
    await _api.getDriver(username).then((value) {
    gender=value.gender;
    weight=value.weight;
    height=value.height;
    date=value.date;
    });
  }
}