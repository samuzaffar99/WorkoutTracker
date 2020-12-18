import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  await db.open();

  const port = 3000;
  final serv = Sevr();

  final driverColl = db.collection('Users');

  serv.get(
    '/:username',
    [
      (ServRequest req, ServResponse res) async {
        //print(request.response);
        final driver = await driverColl
            .findOne(where.eq('username', req.params['username']));
        print("You are inside drivers $driver");
        // if (driver == null) {
        //   // final driver =
        //   //     await driverColl.findOne(where.eq('username', 'default'));
        //   // return res.status(200).json(
        //   //   {'driver': driver},
        //   // );
        //   return null;
        // }
        // //where.eq('name', name)
        return res.status(200).json(
          {'driver': driver},
        );
      },
    ],
  );

  // serv.get(
  //   '/:password',
  //   [
  //     (ServRequest req, ServResponse res) async {
  //       //print(request.response);
  //       final drivers = await driverColl
  //           .findOne(where.eq('password', req.params['password']));
  //       //print("You are inside drivers $drivers");
  //       //where.eq('name', name)
  //       return res.status(200).json(
  //         {'driver': drivers},
  //       );
  //     },
  //   ],
  // );

  serv.post(
    '/',
    [
      (ServRequest req, ServResponse res) async {
        await driverColl.save(req.body);
        return res.status(200).json(
              await driverColl.findOne(
                where.eq(
                  'username', req.body['username'],
                  // 'password',
                  // req.body['password'],
                ),
              ),
            );
      },
    ],
  );

  serv.listen(port, callback: () {
    return print('Server started on port $port');
  });
}
