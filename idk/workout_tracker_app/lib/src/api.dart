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

  Future<User> getUser(String username) async {
    print('await done');
    final response = await _dio.get('/user/username/$username');
    print('out response');
    //print('....${response.data['username']}');
    // if (response == null) {
    //   return null;
    // }
    if (response.data != null) {
      return User.fromJson(response.data);
    }
    return null;
  }

  Future<User> postUser(User user) async {
    String toJson = jsonEncode(user);
    //print("to json...$toJson");
    final response = await _dio.post('', data: toJson);
    //print("response...$response");
    return User.fromJson(response.data);
    // return response.statusCode;
  }

  Future<Map> getWorkout(String wid) async {
    final response = await _dio.get('/workout/_id/$wid');
    return response.data;
  }

  Future<Map> getExercise(String exid) async {
    final response = await _dio.get('/exercise/_id/$exid');
    return response.data;
  }
}

