import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  Http({required this.baseUrl});

  final String baseUrl;
  final Map<String, String> _headers = {};

  _parseJson(String body) {
    var json = jsonDecode(body);

    if (json['error'] != null) {
      throw json['error']['message'];
    } else {
      return json['data'];
    }
  }

  Future<T> get<T, S extends dynamic>(String path, T Function(S) factory,
      {Map<String, String>? headers = const {}}) async {
    var res = await http.get(Uri.parse('$baseUrl$path'),
        headers: {}
          ..addAll(_headers)
          ..addAll(headers!));
    return factory(_parseJson(res.body));
  }

  Future<T> post<T, S extends dynamic>(String path, T Function(S) factory,
      {Map<String, String>? headers, Object? body}) async {
    var res = await http.post(Uri.parse('$baseUrl$path'),
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
