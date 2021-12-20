import 'dart:convert';

import 'package:ecology/helpers/http.dart';
import 'package:ecology/models/user.dart';

import 'base.dart';

class RecycleState extends BaseProvider {
  RecycleState({required this.http});

  Http http;
  var _state = {
    'glass': 0,
    'paper': 0,
    'plastic': 0,
    'batteries': 0,
    'electronic': 0
  };

  get glass => _state['glass'];

  get paper => _state['paper'];

  get plastic => _state['plastic'];

  get batteries => _state['batteries'];

  get electronic => _state['electronic'];

  increment(String key) {
    _state[key] = _state[key]! + 1;
    notifyListeners();
  }

  decrement(String key) {
    _state[key] = _state[key]! - 1;
    notifyListeners();
  }

  submit() async {
    _state.removeWhere((key, value) => value == 0);
    await http.post('/users/me/tracker', User.fromJson,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(_state));
    _state = {
      'glass': 0,
      'paper': 0,
      'plastic': 0,
      'batteries': 0,
      'electronic': 0
    };
    notifyListeners();
  }
}
