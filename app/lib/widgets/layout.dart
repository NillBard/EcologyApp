import 'package:flutter/material.dart';

import 'package:echology/pages/main_screen.dart';
import 'package:echology/pages/sign_up.dart';
import 'package:echology/pages/login.dart';
import 'package:echology/models/auth.dart';

class Layout extends StatelessWidget {
  final AuthModel authModel;

  const Layout({required this.authModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ecology App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: FutureBuilder(
            future: authModel.authenticate(),
            builder: (_, snapshot) {
              if (authModel.isLoading == true) {
                return const CircularProgressIndicator();
              } else if (authModel.isAuthenticated) {
                return MainScreen();
              } else {
                return const Login();
              }
            }),
        routes: {
          '/home': (_) => MainScreen(),
          '/login': (_) => const Login(),
          '/register': (_) => const SignUp(),
        });
  }
}
