import 'package:flutter/material.dart';

import 'package:ecology/widgets/auth_logo.dart';
import 'package:ecology/widgets/form_field.dart';
import 'package:ecology/widgets/button.dart';
import 'package:ecology/providers/sign_up.dart';
import 'package:ecology/providers/auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignUpForm, AuthState>(builder: (_, form, auth, __) {
      if (auth.user != null) {
        Future.delayed(const Duration(milliseconds: 1), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }

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
                    auth.error ?? '',
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: formField(form.email, form.setEmail, "Email",
                        type: TextInputType.emailAddress)),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: formField(form.name, form.setName, "Name"),
                ),
                formField(form.password, form.setPassword, "Password",
                    isPassword: true),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: button(
                        text: "Sign Up",
                        onPressed: () {
                          auth.register(
                              email: form.email,
                              name: form.name,
                              password: form.password);
                        })),
                _showLoginButton(context, () {
                  auth.clearError();
                  Navigator.pushNamed(context, '/login');
                })
              ],
            ),
          )),
        ),
      );
    });
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
