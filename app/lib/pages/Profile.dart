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
            body: Center(
                child: Column(children: <Widget>[
              const Logo(),
              profileInfo(auth.user.name, auth.user.id),
              TypeTrashProcessing("Утилизированно пластика", auth.user.plastic),
              TypeTrashProcessing("Утилизированно бумаги", auth.user.paper),
              TypeTrashProcessing(
                  "Утилизированно электроприборов", auth.user.electronic),
              TypeTrashProcessing(
                  "Утилизированно аккумуляторов", auth.user.batteries),
              TypeTrashProcessing("Утилизированно стекла", auth.user.glass),
              TextButton(
                child: const Text('Log out'),
                onPressed: () {
                  auth.logOut();
                },
              ),
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

Widget TypeTrashProcessing(String typeTrash, int counter) {
  return Container(
      margin: const EdgeInsets.only(top: 10),
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
            '$counter',
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
