import 'package:echology/models/user.dart';
import 'package:flutter/material.dart';

import 'package:echology/pages/main_screen.dart';
import 'package:echology/pages/sign_up.dart';
import 'package:echology/pages/login.dart';
import 'package:echology/models/auth.dart';
import 'package:provider/provider.dart';

class Layout extends StatefulWidget {
  final AuthModel authModel;
  final GlobalKey<NavigatorState> navigator;

  const Layout({required this.authModel, required this.navigator, Key? key})
      : super(key: key);

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
    return Consumer<UserModel>(builder: (_, userModel, __) {
      return MaterialApp(
          title: 'Ecology App',
          theme: ThemeData(primarySwatch: Colors.green),
          navigatorKey: widget.navigator,
          home: FutureBuilder(
              future: _authFuture,
              builder: (_, __) {
                if (widget.authModel.isLoading) {
                  return const CircularProgressIndicator();
                } else if (widget.authModel.isAuthenticated) {
                  return MainScreen(userModel);
                } else {
                  return Login(widget.authModel);
                }
              }),
          routes: {
            '/home': (_) => MainScreen(userModel),
            '/login': (_) => Login(widget.authModel),
            '/register': (_) => SignUp(widget.authModel),
          });
    });
  }
}
