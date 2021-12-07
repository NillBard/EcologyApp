import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';
import 'helper/http.dart';
import 'pages/main_screen.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';

Future main() async {
  await dotenv.load(fileName: ".env.local");
  var baseUrl = dotenv.env['API_URL'];

  if (baseUrl == null) {
    throw Exception("API_URL must be provided in env vars");
  }

  var http = Http(baseUrl);
  var authModel = AuthModel(http);
  await authModel.init();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => authModel)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, auth, _) {
        return MaterialApp(
            title: 'Ecology App',
            theme: ThemeData(primarySwatch: Colors.green),
            home: FutureBuilder(
                future: auth.authenticate(),
                builder: (_, snapshot) {
                  if (auth.isLoading == true) {
                    return const CircularProgressIndicator();
                  } else if (auth.isAuthenticated) {
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
      },
    );
  }
}
