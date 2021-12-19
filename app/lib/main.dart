import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'pages/login.dart';
import 'pages/main_screen.dart';
import 'pages/sign_up.dart';
import 'helpers/http.dart';
import 'providers/login.dart';
import 'providers/sign_up.dart';
import 'providers/auth.dart';

Future main() async {
  await dotenv.load(fileName: ".env.local");
  var baseUrl = dotenv.env['API_URL'];

  if (baseUrl == null) {
    throw Exception("API_URL must be provided in env vars");
  }

  var http = Http(baseUrl: baseUrl);
  var storage = await SharedPreferences.getInstance();
  var authState = AuthState(http: http, storage: storage);

  await authState.authenticate();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => authState),
      ChangeNotifierProvider(create: (_) => LoginForm()),
      ChangeNotifierProvider(create: (_) => SignUpForm())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (_, auth, __) {
      return MaterialApp(
          title: 'Ecology App',
          theme: ThemeData(primarySwatch: Colors.green),
          initialRoute: auth.user != null ? '/home' : '/login',
          routes: {
            '/home': (_) => const MainScreen(),
            '/login': (_) => const Login(),
            '/register': (_) => const SignUp(),
          });
    });
  }
}
