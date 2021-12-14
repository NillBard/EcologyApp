import 'package:flutter/material.dart';

import 'package:echology/widgets/auth_logo.dart';
import 'package:echology/widgets/form_field.dart';
import 'package:echology/widgets/button.dart';
import 'package:echology/models/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
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
                        child: Text(auth.error ?? ''),
                      ),
                      formField(_email, _handleEmailChange, "Email"),
                      formField(_password, _handlePasswordChange, "Password",
                          isPassword: true),
                      button(() {
                        auth.login(_email, _password);
                      }, "Login"),
                      _showSignUpButton(context)
                    ],
                  ),
                ),
              )),
        ),
      );
    });
  }
}

Widget _showSignUpButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Don\'t have an account? ',
          style: TextStyle(color: Colors.grey)),
      TextButton(
          onPressed: () => Navigator.pushNamed(context, '/register'),
          child: const Text('SignUp', style: TextStyle(color: Colors.blue)))
    ],
  );
}
