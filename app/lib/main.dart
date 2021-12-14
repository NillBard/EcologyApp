import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/layout.dart';
import 'models/auth.dart';
import 'helpers/http.dart';

Future main() async {
  await dotenv.load(fileName: ".env.local");
  var baseUrl = dotenv.env['API_URL'];

  if (baseUrl == null) {
    throw Exception("API_URL must be provided in env vars");
  }

  var http = Http(baseUrl);
  var storage = await SharedPreferences.getInstance();
  var authModel = AuthModel(http, storage);

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
      builder: (context, authModel, _) {
        return Layout(authModel: authModel);
      },
    );
  }
}
