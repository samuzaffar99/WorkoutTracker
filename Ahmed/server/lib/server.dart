import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  await db.open();

  const port = 3000;
  final serv = Sevr();

  final driverColl = db.collection('driver');

  serv.get(
    '/:name',
    [
      (ServRequest req, ServResponse res) async {
        //print(request.response);
        final drivers =
            await driverColl.findOne(where.eq('name', req.params['name']));
        print("You are inside drivers $drivers");
        //where.eq('name', name)
        return res.status(200).json(
          {'driver': drivers},
        );
      },
    ],
  );

  serv.post(
    '/',
    [
      (ServRequest req, ServResponse res) async {
        await driverColl.save(req.body);
        return res.status(200).json(
              await driverColl.findOne(
                where.eq(
                  'name',
                  req.body['name'],
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
