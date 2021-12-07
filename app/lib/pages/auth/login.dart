import 'package:echology/bloc/form_bloc.dart';
import 'package:echology/providers/providers.dart';
import 'package:echology/widgets/AuthLogo.dart';
import 'package:echology/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = Provider.of(context);

    return Scaffold(
      body: Container(
          height: 500,
          margin: EdgeInsets.only(top: 120),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AuthLogo(),
                  _emailField(formBloc),
                  _passwordField(formBloc),
                  _logInButton(formBloc),
                  _showSignUpButton(context)
                ],
              ),
            ),
          )),
    );
  }
}

Widget _emailField(FormBloc bloc) {
  return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changeEmail,
          decoration: new InputDecoration(
              hintText: 'Email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
        );
      });
}

Widget _passwordField(FormBloc bloc) {
  return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changePassword,
          obscureText: true,
          textAlign: TextAlign.start,
          decoration: new InputDecoration(
              hintText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
        );
      });
}

Widget _logInButton(FormBloc bloc) {
  return StreamBuilder(
      stream: bloc.submitValidForm,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            onPressed: () {
              if (snapshot.hasError) {
                print(snapshot.error);
                return null;
              }
              bloc.login(context);
            },
            child: Text('Login'));
      });
}

Widget _showSignUpButton(context) {
  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('Don\'t have an account? ', style: TextStyle(color: Colors.grey)),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text(
        'SignUp', 
        style: TextStyle(color: Colors.blue)
        )
      )
    ],
  ));
}
