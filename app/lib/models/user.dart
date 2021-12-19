class User {
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.exp});

  int id;
  String name;
  String email;
  int exp;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: (json['id']),
        name: json['name'],
        email: json['email'],
        exp: json['exp']);
  }
}
