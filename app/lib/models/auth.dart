import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:echology/models/base.dart';
import 'package:echology/helpers/http.dart';

class AuthResponse {
  String accessToken;
  String refreshToken;

  AuthResponse(this.accessToken, this.refreshToken);

  factory AuthResponse.fromJson(dynamic json) {
    return AuthResponse(json['accessToken'], json['refreshToken']);
  }
}

class User {
  int id;
  String name;
  String email;

  User(this.id, this.name, this.email);

  factory User.fromJson(dynamic json) {
    return User(json['id'], json['name'], json['email']);
  }
}

class AuthModel extends BaseModel {
  final Http _http;
  final SharedPreferences _storage;
  bool isAuthenticated = false;
  User? user;

  AuthModel(this._http, this._storage);

  Future<dynamic> _setRefreshToken(String token) async {
    await _storage.setString("refreshToken", token);
  }

  void _enableRefreshing() {
    Future.delayed(const Duration(minutes: 30), authenticate);
  }

  void register(String name, String email, String password) {
    performEffect(() async {
      var data = await _http.post('/auth/register', AuthResponse.fromJson,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'name': name,
            'email': email,
            'password': password,
          }));

      _http.setToken(data.accessToken);
      await _setRefreshToken(data.refreshToken);
      user = User.fromJson(Jwt.parseJwt(data.accessToken));
      isAuthenticated = true;
      _enableRefreshing();
    });
  }

  void login(String email, String password) {
    performEffect(() async {
      var data = await _http.post('/auth/login', AuthResponse.fromJson,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          }));

      _http.setToken(data.accessToken);
      await _setRefreshToken(data.refreshToken);
      user = User.fromJson(Jwt.parseJwt(data.accessToken));
      isAuthenticated = true;
      _enableRefreshing();
    });
  }

  Future<dynamic> authenticate() async {
    try {
      var token = _storage.getString("refreshToken");
      var data = await _http.post('/auth/refresh-tokens', AuthResponse.fromJson,
          headers: {'content-type': 'application/json'},
          body: jsonEncode({'token': token}));

      _http.setToken(data.accessToken);
      await _setRefreshToken(data.refreshToken);
      isAuthenticated = true;
      _enableRefreshing();
      notifyListeners();
    } catch (_) {
      isAuthenticated = false;
    }
  }
}
