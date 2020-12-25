import 'package:flutter/material.dart';
import 'src/api.dart';
import 'src/model.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

Future<Map> getUserInfo(String user) async {
  var db = await mongo.Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var currentUser = db.collection('user');
  await db.open();
  var userDetails = await currentUser.findOne(mongo.where.eq('username', user));
  await db.close();
  if (userDetails == null) {
    userDetails = {'username': null};
  }
  return userDetails;
}

Future<Map> getWorkout(String wid) async {
  var db = await mongo.Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var currentWorkout = db.collection('workout');
  await db.open();
  var workoutDetails = await currentWorkout.findOne(mongo.where.id(mongo.ObjectId.fromHexString(wid)));
  await db.close();
  if (workoutDetails == null) {
    workoutDetails = {'_id': null};
  }
  print("called function");
  return workoutDetails;
}

Future<Map> getExerciseInfo(String exid) async {
  var db = await mongo.Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var currentExercise = db.collection('exercise');
  await db.open();
  var exerciseDetails = await currentExercise.findOne(mongo.where.id(mongo.ObjectId.fromHexString(exid)));
  await db.close();
  print('exercise id to find $exid');
  if (exerciseDetails == null) {
    print('returning null');
    exerciseDetails = {'_id': null};
  }
  return exerciseDetails;
}

