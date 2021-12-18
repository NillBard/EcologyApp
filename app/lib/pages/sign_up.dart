import 'package:flutter/material.dart';

import 'package:echology/widgets/auth_logo.dart';
import 'package:echology/widgets/form_field.dart';
import 'package:echology/widgets/button.dart';
import 'package:echology/models/auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final AuthModel _authModel;

  const SignUp(this._authModel, {Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email = '';
  String _name = '';
  String _password = '';

  void _handleEmailChange(String value) {
    setState(() {
      _email = value;
    });
  }

  void _handleNameChange(String value) {
    setState(() {
      _name = value;
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handleSubmit() {
    widget._authModel.register(_name, _email, _password);
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
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: formField(_name, _handleNameChange, "Name"),
              ),
              formField(_password, _handlePasswordChange, "Password",
                  isPassword: true),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: button(_handleSubmit, "Sign Up")),
              _showLoginButton(context, () {
                widget._authModel.error = null;
                Navigator.pushNamed(context, '/login');
              })
            ],
          ),
        )),
      ),
    );
  }
}

Widget _showLoginButton(context, onPress) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Already have an account? ',
          style: TextStyle(color: Colors.grey, fontSize: 16)),
      TextButton(
          onPressed: onPress,
          child: const Text('Login',
              style: TextStyle(color: Colors.green, fontSize: 16)))
    ],
  );
}
