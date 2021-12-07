import 'dart:async';
import 'dart:convert';
import 'package:echology/pages/auth/auth_serv.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FormBloc {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();
  final _errorMessage = new BehaviorSubject<String>();
  final _name = new BehaviorSubject<String>();

  // getters: Changers
  Function(String) get changeEmail {
    addError('');
    return _email.sink.add;
  }

  Function(String) get changePassword {
    addError('');
    return _password.sink.add;
  }

  Function(String) get changeName {
    addError('');
    return _name.sink.add;
  }

  Function(String) get addError => _errorMessage.sink.add;

  // getters: Add stream
  Stream<String> get email => _email.stream;
  Stream<String> get password => _password.stream;
  Stream<String> get name => _name.stream;
  Stream<String> get errorMessage => _errorMessage.stream;

  Stream<bool> get submitValidForm => Rx.combineLatest3(
        email,
        password,
        errorMessage,
        (e, p, er) => true,
      );

  Stream<bool> get SubmitValidRegForm => Rx.combineLatest4(
        email,
        name,
        password,
        errorMessage,
        (e, n, p, er) => true,
      );

  var authInfo;
  // rgister
  dynamic register(BuildContext context) async {
    authInfo = AuthService();

    final res =
        await authInfo.register(_name.value, _email.value, _password.value);
    final data = jsonDecode(res) as Map<String, dynamic>;

    if (data['status'] != 200) {
      addError(data['error']['message']);
    } else {
      AuthService.setToken(data['token'], data['refreshToken']);
      Navigator.pushNamed(context, '/home');
      return data;
    }
  }

  // login
  dynamic login(BuildContext context) async {
    authInfo = AuthService();

    final res = await authInfo.login(_email.value, _password.value);
    final data = jsonDecode(res) as Map<String, dynamic>;

    if (data['status'] != 200) {
      addError(data['error']['message']);
    } else {
      AuthService.setToken(data['token'], data['refreshToken']);
      Navigator.pushNamed(context, '/home');
      return data;
    }
  }

  // close streams
  dispose() {
    _email.close();
    _password.close();
    _errorMessage.close();
  }
}
