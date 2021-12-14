import 'package:flutter/material.dart';

import 'package:echology/pages/main_screen.dart';
import 'package:echology/pages/sign_up.dart';
import 'package:echology/pages/login.dart';
import 'package:echology/models/auth.dart';

class Layout extends StatefulWidget {
  final AuthModel authModel;

  const Layout({required this.authModel, Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  Future? _authFuture;

  @override
  void initState() {
    super.initState();

    _authFuture = widget.authModel.authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ecology App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: FutureBuilder(
            future: _authFuture,
            builder: (_, __) {
              if (widget.authModel.isLoading) {
                return const CircularProgressIndicator();
              } else if (widget.authModel.isAuthenticated) {
                return MainScreen();
              } else {
                return Login(widget.authModel);
              }
            }),
        routes: {
          '/home': (_) => MainScreen(),
          '/login': (_) => Login(widget.authModel),
          '/register': (_) => SignUp(widget.authModel),
        });
  }
}
