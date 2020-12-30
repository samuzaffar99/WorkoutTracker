import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

//adb reverse tcp:3000 tcp:3000

void start() async {
  final db = await Db.create(
      'mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker');
  await db.open();

  const port = 3000;
  final serv = Sevr();

  final userColl = db.collection('user');
  final workoutColl = db.collection('workout');
  final exerciseColl = db.collection('exercise');
  final dietColl = db.collection('diet');
  final foodColl = db.collection('food');

  serv.listen(port, callback: () {
    return print('Server started on port $port');
  });

  //get
  serv.get(
    '/user',
    [
          (ServRequest req, ServResponse res) async {
        final snapshot = await userColl
            .find({}).toList();
        print('called get /user $snapshot');
        print(res);
        //return res.send(snapshot);
        //return res.status(200).json(snapshot);
      },
    ],
  );
  serv.get(
    '/workout',
    [
          (ServRequest req, ServResponse res) async {
        final snapshot = await exerciseColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /workout $snapshot');
        print(res);
        return res.status(200).json(snapshot);
      },
    ],
  );
  serv.get(
    '/exercise',
    [
          (ServRequest req, ServResponse res) async {
        final snapshot = await exerciseColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /exercise $snapshot');
        print(res);
        return res.status(200).json(snapshot);
      },
    ],
  );
  serv.get(
    '/diet',
    [
          (ServRequest req, ServResponse res) async {
        final snapshot = await exerciseColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /diet $snapshot');
        print(res);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/food',
    [
          (ServRequest req, ServResponse res) async {
        final snapshot = await exerciseColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /food $snapshot');
        print(res);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/user/username/:param',
    [
      (ServRequest req, ServResponse res) async {
        final snapshot = await userColl
            .findOne(where.eq('username', req.params['param']));
        print('called get /user/username/:username $snapshot');
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/user/_id/:param',
    [
      (ServRequest req, ServResponse res) async {
        final snapshot = await userColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /user/_id/:param $snapshot');
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/workout/_id/:param',
    [
          (ServRequest req, ServResponse res) async {
        final snapshot = await workoutColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /workout/_id/:param $snapshot');
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/exercise/_id/:param',
    [
      (ServRequest req, ServResponse res) async {
        final snapshot = await exerciseColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /exercise/_id/:param $snapshot');
        print(res);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/diet/_id/:param',
    [
      (ServRequest req, ServResponse res) async {
        final snapshot = await dietColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /diet/_id/:param $snapshot');
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.get(
    '/food/_id/:param',
    [
      (ServRequest req, ServResponse res) async {
        final snapshot = await foodColl
            .findOne(where.eq('_id', req.params['param']));
        print('called get /food/_id/:param ${req.params['param']} $snapshot');
        return res.status(200).json(snapshot);
      },
    ],
  );

  //post
  serv.post(
    '/user',
    [
      (ServRequest req, ServResponse res) async {
        req.body['_id'] = ObjectId().toHexString();
        final snapshot = await userColl.save(req.body);
        //final user = await userColl.save(req.body);
        return res.status(200).json(
            await userColl.findOne(where.eq('_id', snapshot['upserted'])));
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
        req.body['_id'] = ObjectId().toHexString();
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
        req.body['_id'] = ObjectId().toHexString();
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
        req.body['_id'] = ObjectId().toHexString();
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
        req.body['_id'] = ObjectId().toHexString();
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
        var snapshot = await userColl.save(req.body);
        print(snapshot);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.put(
    '/workout/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var snapshot = await workoutColl.save(req.body);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.put(
    '/exercise/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var snapshot = await exerciseColl.save(req.body);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.put(
    '/diet/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var snapshot = await dietColl.save(req.body);
        return res.status(200).json(snapshot);
      },
    ],
  );

  serv.put(
    '/food/:_id',
    [
      (ServRequest req, ServResponse res) async {
        var snapshot = await foodColl.save(req.body);
        return res.status(200).json(snapshot);
      },
    ],
  );

  //modify
  serv.patch(
    '/user/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await userColl.update((
            where.eq('_id', req.params['_id'])),
            modify.set('name', 31));
        return res.status(200).json(await userColl
            .findOne(where.eq('_id', req.params['_id'])));
      },
    ],
  );

  serv.patch(
    '/workout/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await workoutColl.update((
            where.eq('_id', req.params['_id'])),
            modify.set('name', 31));
        return res.status(200).json(await workoutColl
            .findOne(where.eq('_id', req.params['_id'])));
      },
    ],
  );

  //delete
  serv.delete(
    '/user/:_id',
    [
      (ServRequest req, ServResponse res) async {
        await userColl
            .remove(where.eq('_id', req.body['_id']));
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
