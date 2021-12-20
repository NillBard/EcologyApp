import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:ecology/helpers/http.dart';
import 'package:ecology/models/auth.dart';
import 'package:ecology/models/user.dart';

import 'base.dart';

class AuthState extends BaseProvider {
  AuthState({required this.http, required this.storage});

  final Http http;
  final SharedPreferences storage;
  User? _user;

  get user => _user;

  _fetchUser() async {
    _user = await http.get('/users/me', User.fromJson);
  }

  register(
      {required String email, required String name, required String password}) {
    performEffect(() async {
      var data = await http.post('/auth/register', Auth.fromJson,
          headers: {'content-type': 'application/json'},
          body:
              jsonEncode({'email': email, 'name': name, 'password': password}));

      http.setToken(data.accessToken);
      await storage.setString('refreshToken', data.refreshToken);
      await _fetchUser();
    });
  }

  login({required String email, required String password}) {
    performEffect(() async {
      var data = await http.post('/auth/login', Auth.fromJson,
          headers: {'content-type': 'application/json'},
          body: jsonEncode({'email': email, 'password': password}));

      http.setToken(data.accessToken);
      await storage.setString('refreshToken', data.refreshToken);
      await _fetchUser();
    });
  }

  authenticate() async {
    var token = storage.getString('refreshToken');
    if (token != null) {
      try {
        var data = await http.post('/auth/refresh-tokens', Auth.fromJson,
            headers: {'content-type': 'application/json'},
            body: jsonEncode({'token': token}));

        http.setToken(data.accessToken);
        await storage.setString('refreshToken', data.refreshToken);
        await _fetchUser();
      } catch (_) {}
    }
  }

  logOut() {
    performEffect(() async {
      await storage.remove('refreshToken');
      http.setToken('');
      _user = null;
    });
  }
}
