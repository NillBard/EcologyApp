import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:echology/helper/http.dart';

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

class AuthModel extends ChangeNotifier {
  final Http _http;
  SharedPreferences? _storage;
  bool isAuthenticated = false;
  User? user;
  String? error;
  bool isLoading = false;

  AuthModel(this._http);

  Future init() async {
    _storage = await SharedPreferences.getInstance();
  }

  Future<dynamic> _setRefreshToken(String token) async {
    await _storage!.setString("refreshToken", token);
  }

  void _enableRefreshing() {
    Future.delayed(const Duration(minutes: 30), authenticate);
  }

  Future<dynamic> register(String name, String email, String password) async {
    if (_storage == null) throw Exception("Service is not initialized");

    try {
      error = null;
      isLoading = true;

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
    } catch (err) {
      error = err.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> login(String email, String password) async {
    if (_storage == null) throw Exception("Service is not initialized");

    try {
      error = null;
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
    } catch (err) {
      error = err.toString();
    } finally {
      notifyListeners();
      isLoading = false;
    }
  }

  Future<dynamic> authenticate() async {
    if (_storage == null) throw Exception("Service is not initialized");

    try {
      var token = _storage!.getString("refreshToken");
      var data = await _http.post('/auth/refresh-tokens', AuthResponse.fromJson,
          headers: {'content-type': 'application/json'},
          body: jsonEncode({'token': token}));

      _http.setToken(data.accessToken);
      await _setRefreshToken(data.refreshToken);
      _enableRefreshing();
      notifyListeners();
    } finally {}
  }
}
