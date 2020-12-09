import 'package:mongo_dart/mongo_dart.dart';
void main() async {
  void displayExercise(Map Exercises) {
    print(
        'ExerciseName: ${Exercises["ExerciseName"]}, Muscles: ${Exercises["TargetMuscle"]}, Category: ${Exercises["id"]}, Alias: ${Exercises["pop"]}, Difficulty: ${Exercises["Difficulty"]}');
  }
  //var db = await Db.create("mongodb+srv://<user>:<password>@<host>:<port>/<database-name>?<parameters>");
  var db = Db("mongodb://mongodb+srv:Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var Exercises = db.collection('Exercises');
  await db.open();
  print('''
******************** Zips for state NY, with population between 14000 and 16000,
******************** reverse ordered by population''');
  await Exercises
      .find(where
      .eq('ExerciseName', 'Chest')
      .sortBy('ExerciseName', descending: true))
      .forEach(displayExercise);
  // print('\n******************** Find ZIP for code 78829 (BATESVILLE)');
  // var batesville = await zips.findOne(where.eq('id', '78829'));
  // displayZip(batesville);
  // print('******************** Find 10 ZIP closest to BATESVILLE');
  // await zips
  //     .find(where.near('loc', batesville["loc"]).limit(10))
  //     .forEach(displayZip);
  print('closing db');
  await db.close();
}

