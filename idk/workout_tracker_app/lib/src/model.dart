class Driver {
  final String username;
  final String password;
  final String email;
  final String gender;
  final String weight;
  final String height;
  final String date;

  const Driver._(
      {this.username,
      this.password,
      this.email,
      this.gender,
      this.weight,
      this.height,
      this.date});

  factory Driver.fromJson(Map json) {
    return Driver._(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      gender: json['gender'],
      weight: json['weight'],
      height: json['height'],
      date: json['date'],
    );
  }

  Map toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'gender': gender,
      'date': date,
      'weight': weight,
      'height': height,
    };
  }
}


//food
class food {
  String name;
  double carbs;
  double protein;
  double fat;
  int calories;
  List<String> tags;

  food(
      {this.name,
        this.carbs,
        this.protein,
        this.fat,
        this.calories,
        this.tags});

  food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
    calories = json['calories'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String name;
  String category;
  String difficulty;
  List<String> target;

  exercise({this.name, this.category, this.difficulty, this.target});

  exercise.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    difficulty = json['difficulty'];
    target = json['target'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['difficulty'] = this.difficulty;
    data['target'] = this.target;
    return data;
  }
}
