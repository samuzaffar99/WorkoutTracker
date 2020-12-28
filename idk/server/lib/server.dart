import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

//adb reverse tcp:3000 tcp:3000

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

  //get
  serv.get(
    '/user/username/:username',
    [
      (ServRequest req, ServResponse res) async {
        final user = await userColl
            .findOne(where.eq('username', req.params['username']));
        print('called get /user/username/:username $user');
        return res.status(200).json(user);
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
        print('called get /user/_id/:userid $user');
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
        print('called get /exercise/_id/:exid $exercise');
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
        print('called get /workout/_id/:wid $workout');
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
        print('called get /diet/_id/:dietid $diet');
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
        print('called get /food/_id/:foodid $food');
        return res.status(200).json(food);
      },
    ],
  );

  //post
  serv.post(
    '/user',
    [
      (ServRequest req, ServResponse res) async {
        final user = await userColl.save(req.body);
        return res.status(200).json(
            await userColl.findOne(where.eq('username', req.body['username'])));
        //print('user is $json(user)');
        //return res.status(200).json(user);
        // return res.status(200).json(
        //     await userColl.findOne(where.id(ObjectId.fromHexString(user["upserted"]))));
      },
    ],
  );

  serv.post(
    '/workout',
    [
      (ServRequest req, ServResponse res) async {
        await workoutColl.save(req.body);
        return res.status(200).json(
            await workoutColl.findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  serv.post(
    '/exercise',
    [
      (ServRequest req, ServResponse res) async {
        await exerciseColl.save(req.body);
        return res.status(200).json(
            await exerciseColl.findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  serv.post(
    '/diet',
    [
      (ServRequest req, ServResponse res) async {
        await dietColl.save(req.body);
        return res
            .status(200)
            .json(await dietColl.findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  serv.post(
    '/food',
    [
      (ServRequest req, ServResponse res) async {
        await foodColl.save(req.body);
        return res
            .status(200)
            .json(await userColl.findOne(where.eq('name', req.body['name'])));
      },
    ],
  );

  //update(put)
  serv.put(
    '/user/:_id',
    [
      (ServRequest req, ServResponse res) async {
        print('called this ${req.body}');
        //var Obj = await userColl.findOne(where.id(ObjectId.fromHexString(req.body['_id'])));
        // for(var in req.params){
        //   Obj["field"]=req.params["value"]
        // }
        //Obj["name"] = "abdullah";
        var obj = await userColl.save(req.body);
        print(obj);
        return res.status(200).json(obj);
      },
    ],
  );

  serv.put(
    '/workout/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var obj = await workoutColl.save(req.body);
        return res.status(200).json(obj);
      },
    ],
  );

  serv.put(
    '/exercise/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var obj = await exerciseColl.save(req.body);
        return res.status(200).json(obj);
      },
    ],
  );

  serv.put(
    '/diet/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var obj = await dietColl.save(req.body);
        return res.status(200).json(obj);
      },
    ],
  );

  serv.put(
    '/food/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var obj = await foodColl.save(req.body);
        return res.status(200).json(obj);
      },
    ],
  );

  //modify
  serv.patch(
    '/user/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await userColl.update(
            where.id(ObjectId.fromHexString(req.params['_id'])),
            modify.set('name', 31));
        return res.status(200).json(await userColl
            .findOne(where.id(ObjectId.fromHexString(req.params['_id']))));
      },
    ],
  );

  serv.patch(
    '/workout/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await workoutColl.update(
            where.id(ObjectId.fromHexString(req.params['_id'])),
            modify.set('name', 31));
        return res.status(200).json(await workoutColl
            .findOne(where.id(ObjectId.fromHexString(req.params['_id']))));
      },
    ],
  );

  //delete
  serv.delete(
    '/user/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await userColl
            .remove(where.id(ObjectId.fromHexString(req.body['_id'])));
        return res.status(200);
      },
    ],
  );

  serv.delete(
    '/workout/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await workoutColl
            .remove(where.id(ObjectId.fromHexString(req.body['_id'])));
        return res.status(200);
      },
    ],
  );

  serv.delete(
    '/exercise/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await exerciseColl
            .remove(where.id(ObjectId.fromHexString(req.body['_id'])));
        return res.status(200);
      },
    ],
  );

  serv.delete(
    '/diet/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await dietColl
            .remove(where.id(ObjectId.fromHexString(req.body['_id'])));
        return res.status(200);
      },
    ],
  );

  serv.delete(
    '/food/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await foodColl
            .remove(where.id(ObjectId.fromHexString(req.body['_id'])));
        return res.status(200);
      },
    ],
  );
}
