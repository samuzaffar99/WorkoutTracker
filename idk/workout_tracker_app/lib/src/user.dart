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
  }
}

class Id {
  String oid;

  Id({this.oid});

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

  factory Stats.fromJson(Map json) {
    return Stats(
      height: json['height'],
      weight: json['weight'],
    );
  }

}

class Goals {
  String targetdate;
  String weight;
  String bodyfat;

  Goals({this.targetdate, this.weight, this.bodyfat});


  factory Goals.fromJson(Map json) {
    return Goals(
      targetdate: json['targetdate'],
      weight: json['weight'],
      bodyfat: json['bodyfat'],
    );
  }

}

class Workoutplan {
  Days days;
  Exercisetype exercisetype;

  Workoutplan({this.days, this.exercisetype});

  factory Workoutplan.fromJson(Map json) {
    return Workoutplan(
      days: Days.fromJson(json['days']),
      exercisetype: Exercisetype.fromJson(json['exercisetype']),
    );
  }

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

}

class Exercisetype {
  String homeexercise;
  String powerlifting;
  String bodybuilding;

  Exercisetype({this.homeexercise, this.powerlifting, this.bodybuilding});

  factory Exercisetype.fromJson(Map json) {
    return Exercisetype(
      homeexercise: json['homeexercise'],
      powerlifting: json['powerlifting'],
      bodybuilding: json['bodybuilding'],
    );
  }

}

class Dietplan {
  String fat;
  String protein;
  String carbs;

  Dietplan({this.fat, this.protein, this.carbs});

  factory Dietplan.fromJson(Map json) {
    return Dietplan(
      fat: json['fat'],
      protein: json['protein'],
      carbs: json['carbs'],
    );
  }
}
