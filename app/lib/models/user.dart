import 'package:echology/helpers/http.dart';

import 'base.dart';

class User {
  int id;
  String name;
  String email;
  int exp;

  User(this.id, this.name, this.email, this.exp);

  factory User.fromJson(dynamic json) {
    return User(json['id'], json['name'], json['email'], json['exp']);
  }
}

class UserModel extends BaseModel {
  final Http _http;
  User? user;

  UserModel(this._http);

  Future<void> fetchUser() async {
    performEffect(() async {
      user = await _http.get('/users/me', User.fromJson);
    });
  }
}
