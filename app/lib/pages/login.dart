import 'package:flutter/material.dart';

import 'package:echology/widgets/auth_logo.dart';
import 'package:echology/widgets/form_field.dart';
import 'package:echology/widgets/button.dart';
import 'package:echology/models/auth.dart';

class Login extends StatefulWidget {
  final AuthModel _authModel;

  const Login(this._authModel, {Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';

  void _handleEmailChange(String value) {
    setState(() {
      _email = value;
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handleSubmit() {
    widget._authModel.login(_email, _password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const AuthLogo(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget._authModel.error ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: formField(_email, _handleEmailChange, "Email",
                      type: TextInputType.emailAddress)),
              formField(_password, _handlePasswordChange, "Password",
                  isPassword: true),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: button(_handleSubmit, "Login")),
              _showSignUpButton(context)
            ],
          ),
        )),
      ),
    );
  }
}

Widget _showSignUpButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Don\'t have an account? ',
          style: TextStyle(color: Colors.grey, fontSize: 16)),
      TextButton(
          onPressed: () => Navigator.pushNamed(context, '/register'),
          child: const Text('SignUp',
              style: TextStyle(color: Colors.green, fontSize: 16)))
    ],
  );
}
