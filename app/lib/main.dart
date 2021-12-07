import 'package:echology/pages/MainScreen.dart';
import 'package:echology/pages/auth/login.dart';
import 'package:echology/pages/auth/auth_serv.dart';
import 'package:echology/providers/providers.dart';
import 'package:flutter/material.dart';

import 'pages/auth/sginUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
          title: 'Ecology App',
          theme: ThemeData(primarySwatch: Colors.green),
          home: FutureBuilder(
              future: AuthService.getToken(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return MainScreen();
                } else {
                  return Login();
                }
              }),
          routes: {
            '/home': (_) => MainScreen(),
            '/login': (_) => Login(),
            '/register': (_) => SignUp(),
          }),
    );
  }
}
