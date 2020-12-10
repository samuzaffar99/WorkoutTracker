import 'package:mongo_dart/mongo_dart.dart';

Future<String> calldb() async {
  // void displayExercise(Map Exercises) {
  //   print(
  //       'Username: ${Users["username"]}, Muscles: ${Exercises["TargetMuscle"]}, Category: ${Exercises["id"]}, Alias: ${Exercises["pop"]}, Difficulty: ${Exercises["Difficulty"]}');
  // }
  var db = Db("mongodb://mongodb+srv:Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var Currentuser = db.collection('Users');
  await db.open();
  // print('\n******************** Find ZIP for code 78829 (BATESVILLE)');
  var username = await Currentuser.findOne(where.eq('UserID', 'U0001'));
  await db.close();
  return username["Username"];
}