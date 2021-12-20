import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ecology/widgets/Logo.dart';
import 'package:ecology/providers/auth.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (_, auth, __) {
      if (auth.user != null) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(children: <Widget>[
                  const Logo(),
                  profileInfo(auth.user.name, auth.user.id),
                  Text(
                    "lvl ${(auth.user.exp / 100).ceil()}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const Spacer(flex: 1),
                  LinearProgressIndicator(
                    value: (auth.user.exp % 100).toDouble() / 100,
                  ),
                  const Spacer(flex: 2),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Утилизировано:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  typeTrashProcessing("пластика", auth.user.plastic),
                  typeTrashProcessing("бумаги", auth.user.paper),
                  typeTrashProcessing("электроприборов", auth.user.electronic),
                  typeTrashProcessing("аккумуляторов", auth.user.batteries),
                  typeTrashProcessing("стекла", auth.user.glass),
                  const Spacer(flex: 4),
                  TextButton(
                      child:
                          const Text('Log out', style: TextStyle(fontSize: 20)),
                      onPressed: auth.logOut),
                ])));
      } else {
        return Container();
      }
    });
  }
}

Widget profileInfo(String name, int id) {
  return Column(children: <Widget>[
    Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    ),
    Text(
      '#${id.toString()}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      ),
    ),
  ]);
}

Widget typeTrashProcessing(String typeTrash, int counter) {
  return Container(
      margin: const EdgeInsets.only(top: 12, left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            typeTrash,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
            ),
          ),
          Text(
            ' - $counter ед.',
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
            ),
          )
        ],
      ));
}
