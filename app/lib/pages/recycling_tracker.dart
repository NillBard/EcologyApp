import 'package:ecology/providers/auth.dart';
import 'package:ecology/providers/recycle.dart';
import 'package:flutter/material.dart';

import 'package:ecology/widgets/Logo.dart';
import 'package:ecology/widgets/button.dart';
import 'package:provider/provider.dart';

class RecyclingTracker extends StatelessWidget {
  const RecyclingTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<RecycleState, AuthState>(
        builder: (context, recycleState, authState, _) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            centerTitle: false,
            title: const Text('Recycle',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: <Widget>[
                const Logo(),
                trackButton("Glass", recycleState.glass, recycleState.decrement,
                    recycleState.increment,
                    disabled: recycleState.glass == 0),
                trackButton("Plastic", recycleState.plastic,
                    recycleState.decrement, recycleState.increment,
                    disabled: recycleState.plastic == 0),
                trackButton("Batteries", recycleState.batteries,
                    recycleState.decrement, recycleState.increment,
                    disabled: recycleState.batteries == 0),
                trackButton("Electronic", recycleState.electronic,
                    recycleState.decrement, recycleState.increment,
                    disabled: recycleState.electronic == 0),
                trackButton("Paper", recycleState.paper, recycleState.decrement,
                    recycleState.increment,
                    disabled: recycleState.paper == 0),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: button(
                        text: "Save",
                        onPressed: () async {
                          await recycleState.submit();
                          authState.fetchUser();
                        })),
              ],
            ),
          )));
    });
  }
}

Widget trackButton(String name, counter, decrease, increase,
    {bool disabled = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(name, style: const TextStyle(fontSize: 30)),
      const Spacer(),
      IconButton(
        icon: Icon(
          Icons.remove_circle_outline,
          size: 30,
          color: disabled ? Colors.grey : Colors.red,
        ),
        onPressed: disabled
            ? null
            : () {
                decrease(name.toLowerCase());
              },
      ),
      Text('$counter',
          style: const TextStyle(color: Colors.green, fontSize: 30)),
      IconButton(
        icon:
            const Icon(Icons.add_circle_outline, size: 30, color: Colors.green),
        onPressed: () {
          increase(name.toLowerCase());
        },
      )
    ],
  );
}
