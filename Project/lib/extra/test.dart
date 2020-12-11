import 'package:mongo_dart/mongo_dart.dart';

Future<String> calldb() async {
  // void displayExercise(Map Exercises) {
  //   print(
  //       'Username: ${Users["username"]}, Muscles: ${Exercises["TargetMuscle"]}, Category: ${Exercises["id"]}, Alias: ${Exercises["pop"]}, Difficulty: ${Exercises["Difficulty"]}');
  // }
  var db = Db("mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var currentUser = db.collection('Users');
  await db.open();
  var username = await currentUser.findOne(where.eq('UserID', 'U0001'));
  await db.close();
  return username["Username"];
}

// return FutureBuilder(
//   builder: (context, projectSnap) {
//     if (projectSnap.connectionState == ConnectionState.none &&
//         projectSnap.hasData == null) {
//       //print('project snapshot data is: ${projectSnap.data}');
//       return Container();
//     }
//     return ListView.builder(
//       itemCount: projectSnap.data.length,
//       itemBuilder: (context, index) {
//         ProjectModel project = projectSnap.data[index];
//         return Column(
//           children: <Widget>[
//             // Widget to display the list of project
//           ],
//         );
//       },
//     );
//   },
// );

// Widget getUsername() {
//   return FutureBuilder(
//       future: getUserInfo(),
//       builder: (buildContext, AsyncSnapshot snapshot) {
//         if (snapshot.hasError)
//           throw snapshot.error;
//         else if (!snapshot.hasData) {
//           return Container(
//             child: Center(
//               //child: Text("Waiting..."),
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else {
//           return Container(
//             child: Row(
//               children: [
//                 Text('${snapshot.data["Username"]}'),
//                 SizedBox(width: 2),
//                 Text('${snapshot.data["Gender"]}'),
//               ],
//             ),
//           );
//         }
//       });
// }



// class User {
//   int UserID;
//   String UserLogin;
//   String Password;
//   String Email;
//   var BirthDate;
//   String DisplayName;
//   String Bio;
//   Genders Gender;
//   int Age;
//   double Weight;
//   double Height;
//   double BF;
//   double BMI;
//   double FFMI;
//   Genders getGender() {
//     return Gender;
//   }
//
//   int getAge() {
//     return Age;
//   }
//
//   double getBMR() {
//     double W = Weight;
//     double BMR = (370 + 21.6 * (1 - BF) * W);
//     return BMR;
//   }
// }

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
