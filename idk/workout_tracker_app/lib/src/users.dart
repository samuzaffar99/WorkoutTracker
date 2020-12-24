class Users {
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

  Users(
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

  Users.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    username = json['username'];
    password = json['password'];
    email = json['email'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    workoutplan = json['workoutplan'] != null
        ? new Workoutplan.fromJson(json['workoutplan'])
        : null;
    dietplan = json['dietplan'] != null
        ? new Dietplan.fromJson(json['dietplan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals.toJson();
    }
    if (this.workoutplan != null) {
      data['workoutplan'] = this.workoutplan.toJson();
    }
    if (this.dietplan != null) {
      data['dietplan'] = this.dietplan.toJson();
    }
    return data;
  }
}

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

class Stats {
  String height;
  String weight;

  Stats({this.height, this.weight});

  Stats.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    return data;
  }
}

class Goals {
  String targetdate;
  String weight;
  String bodyfat;

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

class Workoutplan {
  Days days;
  Exercisetype exercisetype;

  Workoutplan({this.days, this.exercisetype});

  Workoutplan.fromJson(Map<String, dynamic> json) {
    days = json['days'] != null ? new Days.fromJson(json['days']) : null;
    exercisetype = json['exercisetype'] != null
        ? new Exercisetype.fromJson(json['exercisetype'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.days != null) {
      data['days'] = this.days.toJson();
    }
    if (this.exercisetype != null) {
      data['exercisetype'] = this.exercisetype.toJson();
    }
    return data;
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

  Days.fromJson(Map<String, dynamic> json) {
    mon = json['Mon'];
    tue = json['Tue'];
    wed = json['Wed'];
    thu = json['Thu'];
    fri = json['Fri'];
    sat = json['Sat'];
    sun = json['Sun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mon'] = this.mon;
    data['Tue'] = this.tue;
    data['Wed'] = this.wed;
    data['Thu'] = this.thu;
    data['Fri'] = this.fri;
    data['Sat'] = this.sat;
    data['Sun'] = this.sun;
    return data;
  }
}

class Exercisetype {
  String homeexercise;
  String powerlifting;
  String bodybuilding;

  Exercisetype({this.homeexercise, this.powerlifting, this.bodybuilding});

  Exercisetype.fromJson(Map<String, dynamic> json) {
    homeexercise = json['homeexercise'];
    powerlifting = json['powerlifting'];
    bodybuilding = json['bodybuilding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeexercise'] = this.homeexercise;
    data['powerlifting'] = this.powerlifting;
    data['bodybuilding'] = this.bodybuilding;
    return data;
  }
}

class Dietplan {
  String fat;
  String protein;
  String carbs;

  Dietplan({this.fat, this.protein, this.carbs});

  Dietplan.fromJson(Map<String, dynamic> json) {
    fat = json['fat'];
    protein = json['protein'];
    carbs = json['carbs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fat'] = this.fat;
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    return data;
  }
}
