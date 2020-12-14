class Driver {
  final String username;
  final String password;
  final String email;
  final String gender;
  final String weight;
  final String height;
  final String date;
  //final String id;

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
        date: json['date']);
  }

  Map toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'gender': gender,
      'weight': weight,
      'height': height,
      'date': date
    };
  }
}
