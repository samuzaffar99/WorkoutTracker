import 'package:dio/dio.dart';
import 'dart:convert';
import 'model.dart';

class Api {
  final _dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:3000/'),
  );

  // Future<List<Driver>> getDrivers(String name) async {
  //   //print('...inside getDrivers()');
  //   final response = await _dio.get('/$name');
  //   //print('...response $response');
  //   return (response.data['driver'] as List)
  //       .map<Driver>((json) => Driver.fromJson(json))
  //       .toList();
  // }

  Future<Driver> getDrivers(String name) async {
    //print('...inside getDrivers()');
    final response = await _dio.get('/$name');
    print('...response $response');
    return Driver.fromJson(response.data['driver']);
  }

  // Future<Driver> getDriver(String un, String pw) async {
  //   //print('...inside getDrivers()');
  //   final response = await getDrivers();
  //   //print('...response $response');
  //   for (int i = 0; i < response.length; i++) {
  //     if (response[i].name == un) {
  //       return response[i];
  //     }
  //   }
  //   return null;
  // }

  //   Future<Driver> getDriver(String un, String pw) async {
  //   //print('...inside getDrivers()');
  //   final response = await _dio.get('');
  //   //print('...response $response');
  //   return (response.data['driver'] as List)
  //       .map<Driver>((json) => Driver.fromJson(json))
  //       .toList(); ;
  //   //print('...response $response');
  //   for (int i = 0; i < response.length; i++) {
  //     if (response[i].name == un) {
  //       return response[i];
  //     }
  //   }
  //   return null;
  // }

  Future<Driver> postDriver(Driver driver) async {
    String toJson = jsonEncode(driver);
    //print("to json...$toJson");
    final response = await _dio.post('', data: toJson);
    //print("response...$response");
    return Driver.fromJson(response.data);
    // return response.statusCode;
  }
}
