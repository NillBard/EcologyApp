import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class AuthModel extends BaseModel {
  final Http _http;
  final SharedPreferences _storage;
  final GlobalKey<NavigatorState> _navigator;
  bool isAuthenticated = false;

  AuthModel(this._http, this._storage, this._navigator);

  Future<dynamic> _setRefreshToken(String token) async {
    await _storage.setString("refreshToken", token);
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
      isAuthenticated = true;
      _navigator.currentState?.pushNamed('/home');
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
      isAuthenticated = true;
      _navigator.currentState?.pushNamed('/home');
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
      notifyListeners();
    } catch (_) {
      isAuthenticated = false;
    }
  }

  void logOut() {
    performEffect(() async {
      _storage.remove("refreshToken");
      isAuthenticated = false;
      _navigator.currentState?.pushNamed('/login');
    });
  }
}
