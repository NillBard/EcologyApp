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
              child: Column(
                children: <Widget>[
                  const Logo(),
                  profileInfo(auth.user.name, auth.user.id),
                  const LsitTypeTrash(),
                  TextButton(
                    child: const Text('Log out'),
                    onPressed: () {
                      auth.logOut();
                    },
                  ),
                ],
              ),
            ));
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

class TypeTrashProcessing extends StatelessWidget {
  const TypeTrashProcessing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Утилизированно пластика: 15 ед.',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
              ),
            ),
            Text('Посмотреть больше',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                )),
          ],
        ));
  }
}

class LsitTypeTrash extends StatelessWidget {
  const LsitTypeTrash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[TypeTrashProcessing(), TypeTrashProcessing()],
    );
  }
}
