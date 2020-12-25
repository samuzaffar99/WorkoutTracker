import 'package:mongo_dart/mongo_dart.dart';

//food
class food {
  ObjectId iId;
  String name;
  int carbs;
  double protein;
  double fat;
  double calories;
  List<String> tags;

  food(
      {this.iId,
        this.name,
        this.carbs,
        this.protein,
        this.fat,
        this.calories,
        this.tags});

  food.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    name = json['name'];
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
    calories = json['calories'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['name'] = this.name;
    data['carbs'] = this.carbs;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['calories'] = this.calories;
    data['tags'] = this.tags;
    return data;
  }
}


//exercise
class exercise {
  ObjectId iId;
  String name;
  String info;
  String category;
  int difficulty;
  List<String> target;

  exercise(
      {this.iId,
        this.name,
        this.info,
        this.category,
        this.difficulty,
        this.target});

  exercise.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    name = json['name'];
    info = json['info'];
    category = json['category'];
    difficulty = json['difficulty'];
    target = json['target'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId.toJson();
    data['name'] = this.name;
    data['info'] = this.info;
    data['category'] = this.category;
    data['difficulty'] = this.difficulty;
    data['target'] = this.target;
    return data;
  }
}


//user
class user {
  ObjectId iId;
  String username;
  String hash;
  String name;
  String email;
  String birthdate;
  String gender;
  Stats stats;
  List<Log> log;
  ObjectId currWorkout;
  ObjectId currDiet;

  user(
      {this.iId,
        this.username,
        this.hash,
        this.name,
        this.email,
        this.birthdate,
        this.gender,
        this.stats,
        this.log,
        this.currWorkout,
        this.currDiet});

  user.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    username = json['username'];
    hash = json['hash'];
    name = json['name'];
    email = json['email'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    if (json['log'] != null) {
      log = new List<Log>();
      json['log'].forEach((v) {
        log.add(new Log.fromJson(v));
      });
    }
    currWorkout = json['curr_workout'];
    currDiet = json['curr_diet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    else{
      data['_id'] = ObjectId();
    }
    data['username'] = this.username;
    data['hash'] = this.hash;
    data['name'] = this.name;
    data['email'] = this.email;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
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
  int height;
  int weight;
  int bodyfat;

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

class Log {
  String date;
  Workout workout;

  Log({this.date, this.workout});

  Log.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    workout =
    json['workout'] != null ? new Workout.fromJson(json['workout']) : null;
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

class Workout {
  ObjectId wid;
  List<Ex> ex;

  Workout({this.wid, this.ex});

  Workout.fromJson(Map<String, dynamic> json) {
    wid = json['wid'];
    if (json['ex'] != null) {
      ex = new List<Ex>();
      json['ex'].forEach((v) {
        ex.add(new Ex.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wid'] = this.wid;
    if (this.ex != null) {
      data['ex'] = this.ex.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ex {
  ObjectId id;
  List<int> reps;
  List<double> weight;
  List<double> dur;

  Ex({this.id, this.reps, this.weight, this.dur});

  Ex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reps = json['reps'].cast<int>();
    weight = json['weight'].cast<double>();
    dur = json['dur'].cast<double>();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reps'] = this.reps;
    data['weight'] = this.weight;
    data['dur'] = this.dur;
    return data;
  }
}


//workout
class workout {
  ObjectId iId;
  String name;
  ObjectId author;
  List<Days> days;

  workout({this.iId, this.name, this.author, this.days});

  workout.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    name = json['name'];
    author = json['author'];
    if (json['days'] != null) {
      days = new List<Days>();
      json['days'].forEach((v) {
        days.add(new Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId.toJson();
    data['name'] = this.name;
    data['author'] = this.author.toJson();
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  String day;
  String time;
  List<Routine> routine;

  Days({this.day, this.time, this.routine});

  Days.fromJson(Map<String, dynamic> json) {
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
  ObjectId exid;
  List<int> reps;
  List<double> dur;
  Routine({this.exid, this.reps, this.dur});

  Routine.fromJson(Map<String, dynamic> json) {
    exid = json['exid'];
    reps = json['reps'].cast<int>();
    dur = json['reps'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exid'] = this.exid.toJson();
    if (this.reps != null) {
      data['reps'] = this.reps;
    }
    if (this.dur != null) {
      data['dur'] = this.dur;
    }
    return data;
  }
}


//diet
class diet {
  ObjectId iId;
  String name;
  List<int> dist;
  int calories;
  ObjectId author;
  List<Dietdays> dietdays;

  diet(
      {this.iId,
        this.name,
        this.dist,
        this.calories,
        this.author,
        this.dietdays});

  diet.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    name = json['name'];
    dist = json['dist'].cast<int>();
    calories = json['calories'];
    author = json['author'];
    if (json['dietdays'] != null) {
      dietdays = new List<Dietdays>();
      json['dietdays'].forEach((v) {
        dietdays.add(new Dietdays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['name'] = this.name;
    data['dist'] = this.dist;
    data['calories'] = this.calories;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.dietdays != null) {
      data['dietdays'] = this.dietdays.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Dietdays {
  String day;
  List<ObjectId> meals;

  Dietdays({this.day, this.meals});

  Dietdays.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['meals'] != null) {
      meals = new List<ObjectId>();
      json['meals'].forEach((v) {
        meals.add(v);
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

// class Driver {
//   final String username;
//   final String password;
//   final String email;
//   final String gender;
//   final String weight;
//   final String height;
//   final String date;
//
//   const Driver._(
//       {this.username,
//       this.password,
//       this.email,
//       this.gender,
//       this.weight,
//       this.height,
//       this.date});
//
//   factory Driver.fromJson(Map json) {
//     return Driver._(
//       username: json['username'],
//       password: json['password'],
//       email: json['email'],
//       gender: json['gender'],
//       weight: json['weight'],
//       height: json['height'],
//       date: json['date'],
//     );
//   }
//
//   Map toJson() {
//     return {
//       'username': username,
//       'password': password,
//       'email': email,
//       'gender': gender,
//       'date': date,
//       'weight': weight,
//       'height': height,
//     };
//   }
// }