import 'package:dio/dio.dart';
import 'dart:convert';
import 'model.dart';

class Api {
  final _dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:3000/'),
  );

  //get
  Future<List> getUsers() async {
    final response = await _dio.get('/user');
    return response.data;
  }
  Future<List> getWorkouts() async {
    final response = await _dio.get('/workout');
    return response.data;
  }
  Future<List> getExercises() async {
    final response = await _dio.get('/exercise');
    return jsonDecode(response.data);
  }
  Future<List> getDiets() async {
    final response = await _dio.get('/diet');
    return response.data;
  }
  Future<List> getFoods() async {
    final response = await _dio.get('/food');
    return response.data;
  }

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

  Future<Map> getUserM(String id) async {
    final response = await _dio.get('/user/userid/$id');
    return response.data;
  }

  Future<Map> getUserNM(String username) async {
    final response = await _dio.get('/user/username/$username');
    print(response.data.runtimeType);
    return response.data;
  }

  Future<Map> getWorkout(String id) async {
    final response = await _dio.get('/workout/_id/$id');
    return response.data;
  }

  Future<Map> getExercise(String id) async {
    final response = await _dio.get('/exercise/_id/$id');
    return response.data;
  }

  Future<Map> getDiet(String id) async {
    final response = await _dio.get('/diet/_id/$id');
    return response.data;
  }

  Future<Map> getFood(String id) async {
    final response = await _dio.get('/food/_id/$id');
    return response.data;
  }

  //post
  Future<User> postUser(User user) async {
    String toJson = jsonEncode(user);
    //print("to json...$toJson");
    final response = await _dio.post('/user', data: toJson);
    print("response...$response");
    return User.fromJson(response.data);
    // return response.statusCode;
  }

  Future<Map> postUserM(User user) async {
    String userJson = jsonEncode(user);
    print(userJson);
    final response = await _dio.post('/user', data: userJson);
    return response.data;
  }


  //put
  Future<void> putUser(User user) async {
    print(user.iId.runtimeType);
    String userJson = jsonEncode(user);
    print(user.iId);
    final response = await _dio.put('/user/${user.iId}', data: userJson);
    print(response.data);
    //return User.fromJson(response.data);
  }

  Future<void> putUserM(Map<String, dynamic> user) async {
    print(user["_id"].runtimeType);
    String userJson = jsonEncode(user);
    print(userJson);
    final response = await _dio.put('/user/${user["_id"]}', data: userJson);
    print(response.data);
    //return User.fromJson(response.data);
  }
}
