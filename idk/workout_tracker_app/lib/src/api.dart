import 'package:dio/dio.dart';
import 'dart:convert';
//import 'user.dart';
import 'model.dart';

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
      print(
          '....${response.data['_id']} , ${response.data['_id'].runtimeType}');
      return User.fromJson(response.data);
    }
    return null;
  }

  Future<User> postUser(User user) async {
    String toJson = jsonEncode(user);
    //print("to json...$toJson");
    final response = await _dio.post('/user', data: toJson);
    //print("response...$response");
    return User.fromJson(response.data);
    // return response.statusCode;
  }

  //////////////////////////////////////////////////
  Future<Map> getUserM(String userid) async {
    if (userid.length > 24) {
      userid = userid.substring(10, 34);
    }
    final response = await _dio.get('/user/userid/$userid');
    return response.data;
  }

  Future<Map> getUserNM(String username) async {
    final response = await _dio.get('/user/username/$username');
    return response.data;
  }

  Future<Map> postUserM(User user) async {
    String userJson = jsonEncode(user);
    print(userJson);
    final response = await _dio.post('/user', data: userJson);
    return response.data;
  }

  Future<Map> getWorkout(String wid) async {
    if (wid.length > 24) {
      wid = wid.substring(10, 34);
    }
    final response = await _dio.get('/workout/_id/$wid');
    return response.data;
  }

  Future<Map> getExercise(String exid) async {
    if (exid.length > 24) {
      exid = exid.substring(10, 34);
    }
    final response = await _dio.get('/exercise/_id/$exid');
    return response.data;
  }

  Future<Map> getFood(String foodid) async {
    if (foodid.length > 24) {
      foodid = foodid.substring(10, 34);
    }
    final response = await _dio.get('/food/_id/$foodid');
    return response.data;
  }

  Future<Map> getDiet(String dietid) async {
    if (dietid.length > 24) {
      dietid = dietid.substring(10, 34);
    }
    final response = await _dio.get('/diet/_id/$dietid');
    return response.data;
  }

  Future<User> putUser(User user) async {
    String userJson = jsonEncode(user);
    final response = await _dio.put('/user/${user.iId}',data: userJson);
    return User.fromJson(response.data);
  }
}
