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
enum Genders {Male,Female}
class User2{
  int UserID;
  String UserLogin;
  String Password;
  String Email;
  var BirthDate;
  String DisplayName;
  String Bio;
  Genders Gender;
  int Age;
  double Weight;
  double Height;
  double BF;
  double BMI;
  double FFMI;
Genders getGender(){
  return Gender;
}
int getAge(){
  return Age;
}
double getBMR(){
  double W=Weight;
  double BMR = (370 + 21.6*(1 - BF)*W);
  return BMR;
}
}
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
