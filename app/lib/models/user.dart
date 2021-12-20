class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.exp,
    required this.paper,
    required this.plastic,
    required this.batteries,
    required this.electronic,
    required this.glass,
  });

  int id;
  String name;
  String email;
  int exp;
  int paper;
  int plastic;
  int glass;
  int batteries;
  int electronic;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id']),
      name: json['name'],
      email: json['email'],
      exp: json['exp'],
      paper: json['paper'],
      glass: json['glass'],
      plastic: json['plastic'],
      electronic: json['electronic'],
      batteries: json['batteries'],
    );
  }
}
