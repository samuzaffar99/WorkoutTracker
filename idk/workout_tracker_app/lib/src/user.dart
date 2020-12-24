import 'package:flutter/material.dart';

class User {
  Id iId;
  String username;
  String password;
  String email;
  String gender;
  String birthdate;
  Stats stats;
  Goals goals;
  Workoutplan workoutplan;
  Dietplan dietplan;

  User(
      {this.iId,
      this.username,
      this.password,
      this.email,
      this.gender,
      this.birthdate,
      this.stats,
      this.goals,
      this.workoutplan,
      this.dietplan});

  getData() {
    print(this.goals);
  }

  factory User.fromJson(Map json) {
    return User(
      iId: Id.fromJson(json['_id']),
      username: json['username'],
      password: json['password'],
      email: json['email'],
      gender: json['gender'],
      birthdate: json['birthdate'],
      stats: Stats.fromJson(json['stats']),
      goals: Goals.fromJson(json['goals']),
      workoutplan: Workoutplan.fromJson(json['workoutplan']),
      dietplan: Dietplan.fromJson(json['dietplan']),
    );
    // iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    // username = json['username'];
    // password = json['password'];
    // email = json['email'];
    // gender = json['gender'];
    // birthdate = json['birthdate'];
    // stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    // goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    // workoutplan = json['workoutplan'] != null
    //     ? new Workoutplan.fromJson(json['workoutplan'])
    //     : null;
    // dietplan = json['dietplan'] != null
    //     ? new Dietplan.fromJson(json['dietplan'])
    //     : null;
  }

  Map toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'gender': gender,
      'birthdate': birthdate,
      'stats': {'height': stats.height, 'weight': stats.weight},
      "goals": {"targetdate": goals.targetdate, "weight": goals.weight, "bodyfat": goals.bodyfat},
      "workoutplan": {
        "days": {
          "Mon": workoutplan.days.mon,
          "Tue": workoutplan.days.tue,
          "Wed": workoutplan.days.wed,
          "Thu": workoutplan.days.thu,
          "Fri": workoutplan.days.fri,
          "Sat": workoutplan.days.sat,
          "Sun": workoutplan.days.sun,
        },
        "exercisetype": {
          "homeexercise": workoutplan.exercisetype.homeexercise,
          "powerlifting": workoutplan.exercisetype.powerlifting,
          "bodybuilding": workoutplan.exercisetype.bodybuilding,
        }
      },
      "dietplan": {"fat": "12", "protein": "12", "carbs": "12"}
    };
    //   final Map data = new Map();
    //   if (this.iId != null) {
    //     data['_id'] = this.iId.toJson();
    //   }
    //   data['username'] = this.username;
    //   data['password'] = this.password;
    //   data['email'] = this.email;
    //   data['gender'] = this.gender;
    //   data['birthdate'] = this.birthdate;
    //   if (this.stats != null) {
    //     data['stats'] = this.stats.toJson();
    //   }
    //   if (this.goals != null) {
    //     data['goals'] = this.goals.toJson();
    //   }
    //   if (this.workoutplan != null) {
    //     data['workoutplan'] = this.workoutplan.toJson();
    //   }
    //   if (this.dietplan != null) {
    //     data['dietplan'] = this.dietplan.toJson();
    //   }
    //   return data;
  }
}

class Id {
  String oid;

  Id({this.oid});

  // Id.fromJson(Map json) {
  //   oid = json['$oid'];
  // }

  factory Id.fromJson(String id) {
    return Id(
      oid: id,
    );
  }

  Map toJson() {
    final Map data = new Map();
    data['$oid'] = this.oid;
    return data;
  }
}

class Stats {
  String height;
  String weight;

  Stats({this.height, this.weight});

  // Stats.fromJson(Map json) {
  //   height = json['height'];
  //   weight = json['weight'];
  // }

  factory Stats.fromJson(Map json) {
    return Stats(
      height: json['height'],
      weight: json['weight'],
    );
  }

  // Map toJson() {
  //   final Map data = new Map();
  //   data['height'] = this.height;
  //   data['weight'] = this.weight;
  //   return data;
  // }
}

class Goals {
  String targetdate;
  String weight;
  String bodyfat;

  Goals({this.targetdate, this.weight, this.bodyfat});

  // Goals.fromJson(Map json) {
  //   targetdate = json['targetdate'];
  //   weight = json['weight'];
  //   bodyfat = json['bodyfat'];
  // }

  factory Goals.fromJson(Map json) {
    return Goals(
      targetdate: json['targetdate'],
      weight: json['weight'],
      bodyfat: json['bodyfat'],
    );
  }

  // Map toJson() {
  //   final Map data = new Map();
  //   data['targetdate'] = this.targetdate;
  //   data['weight'] = this.weight;
  //   data['bodyfat'] = this.bodyfat;
  //   return data;
  // }
}

class Workoutplan {
  Days days;
  Exercisetype exercisetype;

  Workoutplan({this.days, this.exercisetype});

  // Workoutplan.fromJson(Map json) {
  //   days = json['days'] != null ? new Days.fromJson(json['days']) : null;
  //   exercisetype = json['exercisetype'] != null
  //       ? new Exercisetype.fromJson(json['exercisetype'])
  //       : null;
  // }

  factory Workoutplan.fromJson(Map json) {
    return Workoutplan(
      days: Days.fromJson(json['days']),
      exercisetype: Exercisetype.fromJson(json['exercisetype']),
    );
  }

  // Map toJson() {
  //   final Map data = new Map();
  //   if (this.days != null) {
  //     data['days'] = this.days.toJson();
  //   }
  //   if (this.exercisetype != null) {
  //     data['exercisetype'] = this.exercisetype.toJson();
  //   }
  //   return data;
  // }
}

class Days {
  String mon;
  String tue;
  String wed;
  String thu;
  String fri;
  String sat;
  String sun;

  Days({this.mon, this.tue, this.wed, this.thu, this.fri, this.sat, this.sun});

  factory Days.fromJson(Map json) {
    return Days(
      mon: json['Mon'],
      tue: json['Tue'],
      wed: json['Wed'],
      thu: json['Thu'],
      fri: json['Fri'],
      sat: json['Sat'],
      sun: json['Sun'],
    );
  }

  // Map toJson() {
  //   final Map data = new Map();
  //   data['Mon'] = this.mon;
  //   data['Tue'] = this.tue;
  //   data['Wed'] = this.wed;
  //   data['Thu'] = this.thu;
  //   data['Fri'] = this.fri;
  //   data['Sat'] = this.sat;
  //   data['Sun'] = this.sun;
  //   return data;
  // }
}

class Exercisetype {
  String homeexercise;
  String powerlifting;
  String bodybuilding;

  Exercisetype({this.homeexercise, this.powerlifting, this.bodybuilding});

  // Exercisetype.fromJson(Map json) {
  //   homeexercise = json['homeexercise'];
  //   powerlifting = json['powerlifting'];
  //   bodybuilding = json['bodybuilding'];
  // }

  factory Exercisetype.fromJson(Map json) {
    return Exercisetype(
      homeexercise: json['homeexercise'],
      powerlifting: json['powerlifting'],
      bodybuilding: json['bodybuilding'],
    );
  }

  // Map toJson() {
  //   final Map data = new Map();
  //   data['homeexercise'] = this.homeexercise;
  //   data['powerlifting'] = this.powerlifting;
  //   data['bodybuilding'] = this.bodybuilding;
  //   return data;
  // }
}

class Dietplan {
  String fat;
  String protein;
  String carbs;

  Dietplan({this.fat, this.protein, this.carbs});

  // Dietplan.fromJson(Map json) {
  //   fat = json['fat'];
  //   protein = json['protein'];
  //   carbs = json['carbs'];
  // }

  factory Dietplan.fromJson(Map json) {
    return Dietplan(
      fat: json['fat'],
      protein: json['protein'],
      carbs: json['carbs'],
    );
  }

  // Map toJson() {
  //   final Map data = new Map();
  //   data['fat'] = this.fat;
  //   data['protein'] = this.protein;
  //   data['carbs'] = this.carbs;
  //   return data;
  // }
}
