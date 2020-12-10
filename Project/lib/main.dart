import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home:WelcomeScreen(),
    );
  }
}

// void main() async {
//   void displayExercise(Map Exercises) {
//     print("called");
//     print(
//         'ExerciseName: ${Exercises["ExerciseName"]}, Muscles: ${Exercises["TargetMuscle"]}, Category: ${Exercises["id"]}, Alias: ${Exercises["pop"]}, Difficulty: ${Exercises["Difficulty"]}');
//   }
//   //var db = await Db.create("mongodb+srv://<user>:<password>@<host>:<port>/<database-name>?<parameters>");
//   var db = await Db.create("mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
//   var Exercises = db.collection('Exercises');
//   await db.open();
//   print("lel");
//   await Exercises
//       .find(where
//       .eq('TargetMuscle', 'Chest')
//       .sortBy('ExerciseName', descending: true))
//       .forEach(displayExercise);
//   var Currentuser = db.collection('Users');
//   var username = await Currentuser.findOne(where.eq('UserID', 'U0001'));
//   print(username["Username"]);
//   await db.close();
//   print('closing db');
// }
