import 'package:flutter/material.dart';

import 'package:echology/widgets/auth_logo.dart';
import 'package:echology/widgets/form_field.dart';
import 'package:echology/widgets/button.dart';
import 'package:echology/models/auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(builder: (_, auth, __) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: 550,
              margin: const EdgeInsets.only(top: 75),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const AuthLogo(),
                      SizedBox(
                        width: 300,
                        height: 35,
                        child: Text(
                          auth.error ?? '',
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      formField(_email, _handleEmailChange, "Email"),
                      formField(_name, _handleNameChange, "Name"),
                      formField(_password, _handlePasswordChange, "Password",
                          isPassword: true),
                      button(() {
                        auth.register(_name, _email, _password);
                      }, "Sign Up"),
                      _showLogInButton(context)
                    ],
                  ),
                ),
              )),
        ),
      );
    });
  }
}

Widget _showLogInButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Already have an account? ',
          style: TextStyle(color: Colors.grey)),
      TextButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          child: const Text('LogIn', style: TextStyle(color: Colors.blue)))
    ],
  );
}
