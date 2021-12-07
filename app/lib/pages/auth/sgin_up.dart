import 'package:echology/bloc/form_bloc.dart';
import 'package:echology/helper/hepler.dart';
import 'package:echology/providers/providers.dart';
import 'package:echology/widgets/auth_logo.dart';
import 'package:echology/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = Provider.of(context);

    return Scaffold(
      body: Container(
          height: 550,
          margin: EdgeInsets.only(top: 75),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AuthLogo(),
                  Container(
                    width: 300,
                    height: 35,
                    child: Helper().errorMessage(formBloc),
                  ),
                  _emailField(formBloc),
                  _nameField(formBloc),
                  _passwordField(formBloc),
                  _siginUpButton(formBloc),
                  _showLogInButton(context)
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

Widget _nameField(FormBloc bloc) {
  return StreamBuilder(
      stream: bloc.name,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changeName,
          textAlign: TextAlign.start,
          decoration: new InputDecoration(
              hintText: 'Name',
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

Widget _siginUpButton(FormBloc bloc) {
  return StreamBuilder(
      stream: bloc.SubmitValidRegForm,
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
              bloc.register(context);
            },
            child: Text('SignUp'));
      });
}

Widget _showLogInButton(context) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
      TextButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          child: Text('LogIn', style: TextStyle(color: Colors.blue)))
    ],
  ));
}
