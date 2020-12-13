class Driver {
  final String name;
  final String password;

  const Driver._({this.name, this.password});

  factory Driver.fromJson(Map json) {
    return Driver._(name: json['name'], password: json['password']);
  }

  Map toJson() {
    return {'name': name, 'password': password};
  }
}
