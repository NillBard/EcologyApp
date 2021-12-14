import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  final String _baseURL;
  final Map<String, String> _headers = {};

  Http(this._baseURL);

  _parseJson(String body) {
    var json = jsonDecode(body);

    if (json['status'] >= 300) {
      throw json['error']['message'];
    } else {
      return json['data'];
    }
  }

  Future<T> get<T>(String path, T Function(dynamic) factory,
      {Map<String, String>? headers = const {}}) async {
    var res = await http.get(Uri.parse('$_baseURL$path'),
        headers: {}
          ..addAll(_headers)
          ..addAll(headers!));
    return factory(_parseJson(res.body));
  }

  Future<T> post<T>(String path, T Function(dynamic) factory,
      {Map<String, String>? headers, Object? body}) async {
    var res = await http.post(Uri.parse('$_baseURL$path'),
        headers: {}
          ..addAll(_headers)
          ..addAll(headers!),
        body: body);
    return factory(_parseJson(res.body));
  }

  void setToken(String token) {
    _headers.addAll({"Authorization": 'Bearer $token'});
  }
}
