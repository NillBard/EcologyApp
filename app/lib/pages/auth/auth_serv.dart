import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final baseUrl = 'http://192.168.1.106:4200/api';
  // ignore: non_constant_identifier_names
  static final SESSION = FlutterSession();

  Future<dynamic> register(String name, String email, String password) async {
    try {
      var res = await http.post('$baseUrl/auth/register',
       headers: <String, String>{
      'Content-Type': 'application/json',
      },
       body: jsonEncode(<String, String> {
        'name': name,
        'email': email,
        'password': password,
      })
      );

      return res.body;
    } finally {
      // done you can do something here
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      var res = await http.post(
        '$baseUrl/auth/login',
        headers: <String, String>{
      'Content-Type': 'application/json',
      },
        body: jsonEncode(<String, String> {
          'email': email,
          'password': password,
        })
      );

      return res?.body;
    } finally {
      // you can do somethig here
    }
  }

  static setToken(String token, String refreshToken) async {
    _AuthData data = _AuthData(token, refreshToken);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken()async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String accessToken, refreshToken;
  _AuthData(this.accessToken, this.refreshToken);

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    
    return data;
  }
}