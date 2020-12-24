import 'package:dio/dio.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'model.dart';
import 'user.dart';

class Api {
  final _dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:3000/'),
  );

  Future<Driver> getDriver(String username) async {
    print('await done');
    final response = await _dio.get('/$username');
    if (response.data['driver'] == null) {
      print("im here");
      return null;
    }
    return Driver.fromJson(response.data['driver']);
  }

  Future<User> getUser(String username) async {
    print('await done');
    final response = await _dio.get('/$username');
    print('out response');
    //print('....${response.data['username']}');
    // if (response == null) {
    //   return null;
    // }
    if (response.data!=null)
      {
        return User.fromJson(response.data);
      }
  }

  Future<User> postUser(User user) async {
    String toJson = jsonEncode(user);
    //print("to json...$toJson");
    final response = await _dio.post('', data: toJson);
    //print("response...$response");
    return User.fromJson(response.data);
    // return response.statusCode;
  }

  Future<Driver> postDriver(Driver driver) async {
    String toJson = jsonEncode(driver);
    //print("to json...$toJson");
    final response = await _dio.post('', data: toJson);
    //print("response...$response");
    return Driver.fromJson(response.data);
    // return response.statusCode;
  }
}
