import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
      'mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker');
  await db.open();

  const port = 3000;
  final serv = Sevr();

  final usersColl = db.collection('Users');
  final workoutColl = db.collection('workout');
  final exerciseColl = db.collection('exercise');
  final dietColl = db.collection('diet');
  final foodColl = db.collection('food');

  serv.get(
    '/user/username/:username',
    [
      (ServRequest req, ServResponse res) async {
        final user = await usersColl
            .findOne(where.eq('username', req.params['username']));
        print('You are inside get $user');
        return res.status(200).json(user);
      },
    ],
  );


  serv.post(
    '/',
    [
      (ServRequest req, ServResponse res) async {
        await usersColl.save(req.body);
        return res.status(200).json(await usersColl
            .findOne(where.eq('username', req.body['username'])));
      },
    ],
  );

  serv.listen(port, callback: () {
    return print('Server started on port $port');
  });

  serv.get(
    '/user/_id/:userid',
    [
          (ServRequest req, ServResponse res) async {
        final user = await usersColl
            .findOne(where.id(ObjectId.fromHexString(req.params['userid'])));
        print('You are inside get $user');
        return res.status(200).json(user);
      },
    ],
  );

  serv.get(
    '/exercise/_id/:exid',
    [
          (ServRequest req, ServResponse res) async {
        final exercise = await exerciseColl
            .findOne(where.id(ObjectId.fromHexString(req.params['exid'])));
        print('You are inside get $exercise');
        print(res);
        return res.status(200).json(exercise);
      },
    ],
  );

  serv.get(
    '/workout/_id/:wid',
    [
          (ServRequest req, ServResponse res) async {
        final workout = await workoutColl
            .findOne(where.id(ObjectId.fromHexString(req.params['wid'])));
        print('You are inside get $workout');
        return res.status(200).json(workout);
      },
    ],
  );

  serv.get(
    '/diet/_id/:dietid',
    [
          (ServRequest req, ServResponse res) async {
        final diet = await dietColl
            .findOne(where.id(ObjectId.fromHexString(req.params['dietid'])));
        print('You are inside get $diet');
        return res.status(200).json(diet);
      },
    ],
  );

  serv.get(
    '/food/_id/:foodid',
    [
          (ServRequest req, ServResponse res) async {
        final food = await foodColl
            .findOne(where.id(ObjectId.fromHexString(req.params['foodid'])));
        print('You are inside get $food');
        return res.status(200).json(food);
      },
    ],
  );
}
