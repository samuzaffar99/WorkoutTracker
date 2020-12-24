import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
      'mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker');
  await db.open();

  const port = 3000;
  final serv = Sevr();

  final driverColl = db.collection('Users');

  serv.get(
    '/:username',
    [
      (ServRequest req, ServResponse res) async {
        final user = await driverColl
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
        await driverColl.save(req.body);
        return res.status(200).json(
              await driverColl.findOne(
                where.eq('username', req.body['username'])));
      },
    ],
  );

  serv.listen(port, callback: () {
    return print('Server started on port $port');
  });
}
