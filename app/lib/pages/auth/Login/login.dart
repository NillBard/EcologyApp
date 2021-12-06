// import 'package:echology/widgets/AuthLogo.dart';
// import 'package:echology/widgets/Logo.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';



// class Login extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             height: 450,
//             margin: EdgeInsets.only(top: 120),
//             child: Center(
//               child: _loginForm(),
//             )));
//   }
// }

// Widget _loginForm() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 60),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         AuthLogo(),
//         _emailField(),
//         _passwordField(),
//         _logInButton(),
//         // _showSignUpButton()
//       ],
//     ),
//   );
// }

// Widget _emailField() {
//   return TextFormField(
//     validator: (value)=>null,
//     decoration: new InputDecoration(
//         hintText: 'Email',
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
//   );
// }

// Widget _passwordField() {
//   return TextFormField(
//     obscureText: true,
//     validator: (value)=>null,
//     textAlign: TextAlign.start,
//     decoration: new InputDecoration(
//         hintText: 'Password',
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
//   );
// }

// Widget _logInButton() {
//   return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         fixedSize: Size.fromWidth(400),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//       onPressed: () {},
//       child: Text('Login'));
// }

// Widget _showSignUpButton() {
//   return SafeArea(
//       child: TextButton(
//           onPressed: () {}, child: Text('Don\'t have an account? Sign Up')));
// }


import 'package:flutter/material.dart';
import 'package:login_statefull/src/mixins/helper.dart';

import '../blocs/form_bloc.dart';
import '../providers/provider.dart';

class LoginScreen extends StatelessWidget {
  // single approch way
  // final bloc = new FormBloc();

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = Provider.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
          height: 550.0,
          child: Form(
            child: Column(
              children: <Widget>[
                _emailField(formBloc),
                _passwordField(formBloc),
                Container(
                  width: 300,
                  height: 35,
                  child: Helper().errorMessage(formBloc),
                ),
                _checkBox(),
                _buttonField(formBloc),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/forgot_password'),
                      child: Container(
                        child: Text('Forgot password?'),
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signup'),
                      child: Container(
                        child: Text('Register'),
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField(FormBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget _passwordField(FormBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changePassword,
            maxLength: 20,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget _checkBox() {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: (checked) => {},
          value: true,
        ),
        Text('keep me logged in'),
      ],
    );
  }

  Widget _buttonField(FormBloc bloc) {
    return StreamBuilder<bool>(
        stream: bloc.submitValidForm,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: () {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return null;
                }
                bloc.login(context);
              },
              child: const Icon(Icons.arrow_forward),
              color: Colors.amber,
              clipBehavior: Clip.hardEdge,
              elevation: 10,
              disabledColor: Colors.blueGrey,
              disabledElevation: 10,
              disabledTextColor: Colors.white,
            ),
          );
        });
  }
}