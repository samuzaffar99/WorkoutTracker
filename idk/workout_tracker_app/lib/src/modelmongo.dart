import 'package:mongo_dart/mongo_dart.dart';
import 'package:workout_tracker_app/src/model.dart';

//ObjectId
class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

//User
class User {
  Id iId;
  String username;
  String hash;
  String email;
  String name;
  String gender;
  String birthdate;
  Stats stats;
  Goals goals;
  List<Log> log;
  Id currWorkout;
  Id currDiet;

  User(
      {this.iId,
      this.username,
      this.hash,
      this.email,
      this.name,
      this.gender,
      this.birthdate,
      this.stats,
      this.goals,
      this.log,
      this.currWorkout,
      this.currDiet});

  User.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    username = json['username'];
    hash = json['hash'];
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    if (json['log'] != null) {
      log = new List<Log>();
      json['log'].forEach((v) {
        log.add(new Log.fromJson(v));
      });
    }
    currWorkout = json['curr_workout'] != null
        ? new Id.fromJson(json['curr_workout'])
        : null;
    currDiet =
        json['curr_diet'] != null ? new Id.fromJson(json['curr_diet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['username'] = this.username;
    data['hash'] = this.hash;
    data['email'] = this.email;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals.toJson();
    }
    if (this.log != null) {
      data['log'] = this.log.map((v) => v.toJson()).toList();
    }
    if (this.currWorkout != null) {
      data['curr_workout'] = this.currWorkout.toJson();
    }
    if (this.currDiet != null) {
      data['curr_diet'] = this.currDiet.toJson();
    }
    return data;
  }
}

class Stats {
  double height;
  double weight;
  double bodyfat;

  Stats({this.height, this.weight, this.bodyfat});

  Stats.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    bodyfat = json['bodyfat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['bodyfat'] = this.bodyfat;
    return data;
  }
}

class Goals {
  String targetdate;
  double weight;
  double bodyfat;

  Goals({this.targetdate, this.weight, this.bodyfat});

  Goals.fromJson(Map<String, dynamic> json) {
    targetdate = json['targetdate'];
    weight = json['weight'];
    bodyfat = json['bodyfat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['targetdate'] = this.targetdate;
    data['weight'] = this.weight;
    data['bodyfat'] = this.bodyfat;
    return data;
  }
}

class Log {
  String date;
  WorkoutLog workout;

  Log({this.date, this.workout});

  Log.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    workout = json['workout'] != null
        ? new WorkoutLog.fromJson(json['workout'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.workout != null) {
      data['workout'] = this.workout.toJson();
    }
    return data;
  }
}

class WorkoutLog {
  Id wid;
  List<Ex> ex;

  WorkoutLog({this.wid, this.ex});

  WorkoutLog.fromJson(Map<String, dynamic> json) {
    wid = json['wid'] != null ? new Id.fromJson(json['wid']) : null;
    if (json['ex'] != null) {
      ex = new List<Ex>();
      json['ex'].forEach((v) {
        ex.add(new Ex.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wid != null) {
      data['wid'] = this.wid.toJson();
    }
    if (this.ex != null) {
      data['ex'] = this.ex.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ex {
  Id id;
  List<int> reps;
  List<double> weight;
  List<double> dur;

  Ex({this.id, this.reps, this.weight, this.dur});

  Ex.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    reps = json['reps'].cast<int>();
    weight = json['weight'].cast<double>();
    dur = json['dur'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    data['reps'] = this.reps;
    data['weight'] = this.weight;
    data['dur'] = this.dur;
    return data;
  }
}

//Workout
class Workout {
  Id iId;
  String name;
  Id author;
  List<WDays> days;

  Workout({this.iId, this.name, this.author, this.days});

  Workout.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    name = json['name'];
    author = json['author'] != null ? new Id.fromJson(json['author']) : null;
    if (json['days'] != null) {
      days = new List<WDays>();
      json['days'].forEach((v) {
        days.add(new WDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['name'] = this.name;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WDays {
  String day;
  String time;
  List<Routine> routine;

  WDays({this.day, this.time, this.routine});

  WDays.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    time = json['time'];
    if (json['routine'] != null) {
      routine = new List<Routine>();
      json['routine'].forEach((v) {
        routine.add(new Routine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['time'] = this.time;
    if (this.routine != null) {
      data['routine'] = this.routine.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Routine {
  Id exid;
  List<int> reps;
  List<double> dur;

  Routine({this.exid, this.reps, this.dur});

  Routine.fromJson(Map<String, dynamic> json) {
    exid = json['exid'] != null ? new Id.fromJson(json['exid']) : null;
    reps = json['reps'].cast<int>();
    dur = json['dur'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exid != null) {
      data['exid'] = this.exid.toJson();
    }
    data['reps'] = this.reps;
    data['dur'] = this.dur;
    return data;
  }
}

//Exercise
class Exercise {
  Id iId;
  String name;
  String category;
  String info;
  double difficulty;
  List<String> target;

  Exercise(
      {this.iId,
      this.name,
      this.category,
      this.info,
      this.difficulty,
      this.target});

  Exercise.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    name = json['name'];
    category = json['category'];
    info = json['info'];
    difficulty = json['difficulty'];
    target = json['target'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['name'] = this.name;
    data['category'] = this.category;
    data['info'] = this.info;
    data['difficulty'] = this.difficulty;
    data['target'] = this.target;
    return data;
  }
}

//Diet
class Diet {
  Id iId;
  String name;
  Id author;
  double calories;
  Dist dist;
  List<Days> days;
  List<String> tags;

  Diet({this.iId, this.name, this.author, this.calories, this.dist, this.days});

  Diet.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    name = json['name'];
    author = json['author'] != null ? new Id.fromJson(json['author']) : null;
    calories = json['calories'];
    dist = json['dist'] != null ? new Dist.fromJson(json['dist']) : null;
    if (json['days'] != null) {
      days = new List<Days>();
      json['days'].forEach((v) {
        days.add(new Days.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['name'] = this.name;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['calories'] = this.calories;
    if (this.dist != null) {
      data['dist'] = this.dist.toJson();
    }

    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dist {
  double carbs;
  double protein;
  double fat;

  Dist({this.carbs, this.protein, this.fat});

  Dist.fromJson(Map<String, dynamic> json) {
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carbs'] = this.carbs;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    return data;
  }
}

class Days {
  String day;
  List<Id> meals;

  Days({this.day, this.meals});

  Days.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['meals'] != null) {
      meals = new List<Id>();
      json['meals'].forEach((v) {
        meals.add(new Id.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//Food
class Food {
  Id iId;
  String name;
  double calories;
  double carbs;
  double protein;
  double fat;
  List<String> tags;

  Food(
      {this.iId,
      this.name,
      this.calories,
      this.carbs,
      this.protein,
      this.fat,
      this.tags});

  Food.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    name = json['name'];
    calories = json['calories'];
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['name'] = this.name;
    data['calories'] = this.calories;
    data['carbs'] = this.carbs;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['tags'] = this.tags;
    return data;
  }
}
