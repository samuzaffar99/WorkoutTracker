import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
      'mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker');
  await db.open();

  const port = 3000;
  final serv = Sevr();

  final userColl = db.collection('Users');
  final workoutColl = db.collection('workout');
  final exerciseColl = db.collection('exercise');
  final dietColl = db.collection('diet');
  final foodColl = db.collection('food');

  serv.get(
    '/user/username/:username',
    [
      (ServRequest req, ServResponse res) async {
        final user = await userColl
            .findOne(where.eq('username', req.params['username']));
        print('You are inside get $user');
        return res.status(200).json(user);
      },
    ],
  );


  serv.post(
    '/user/',
    [
      (ServRequest req, ServResponse res) async {
        await userColl.save(req.body);
        return res.status(200).json(await userColl
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
        final user = await userColl
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

  serv.post(
    '/food/',
    [
          (ServRequest req, ServResponse res) async {
        await foodColl.save(req.body);
        return res.status(200).json(await userColl
            .findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  serv.post(
    '/diet/',
    [
          (ServRequest req, ServResponse res) async {
        await dietColl.save(req.body);
        return res.status(200).json(await dietColl
            .findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  serv.post(
    '/exercise/',
    [
          (ServRequest req, ServResponse res) async {
        await exerciseColl.save(req.body);
        return res.status(200).json(await exerciseColl
            .findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  serv.post(
    '/workout/',
    [
          (ServRequest req, ServResponse res) async {
        await workoutColl.save(req.body);
        return res.status(200).json(await workoutColl
            .findOne(where.eq('name', req.body['name'])));
      },
    ],
  );
  
}
