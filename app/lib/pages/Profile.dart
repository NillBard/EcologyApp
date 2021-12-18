import 'package:echology/models/user.dart';
import 'package:flutter/material.dart';

import 'package:echology/widgets/Logo.dart';

class Profile extends StatefulWidget {
  final UserModel userModel;

  const Profile(this.userModel, {Key? key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  Future? _userFuture;

  @override
  void initState() {
    super.initState();

    _userFuture = widget.userModel.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _userFuture,
          builder: (_, __) {
            if (widget.userModel.isLoading || widget.userModel.user == null) {
              return const CircularProgressIndicator();
            } else {
              return Center(
                child: Column(
                  children: <Widget>[
                    const Logo(),
                    profileInfo(
                        widget.userModel.user!.name, widget.userModel.user!.id),
                    const LsitTypeTrash(),
                    TextButton(
                      child: const Text('Log out'),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              );
            }
          }),
    );
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
