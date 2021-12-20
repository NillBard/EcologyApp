import 'package:flutter/material.dart';

import '../widgets/Logo.dart';
import '../widgets/button.dart';

class RecyclingTracker extends StatefulWidget {
  const RecyclingTracker({Key? key}) : super(key: key);

  @override
  _RecyclingTrackerState createState() => _RecyclingTrackerState();
}

class _RecyclingTrackerState extends State<RecyclingTracker> {
  int glassCounter = 0;
  int paperCounter = 0;
  int plasticCounter = 0;
  int batteriesCounter = 0;
  int electronicCounter = 0;

  void _minusGlassCounter() {
    setState(() {
      glassCounter--;
    });
  }

  void _plusGlassCounter() {
    setState(() {
      glassCounter++;
    });
  }

  void _minusPaperCounter() {
    setState(() {
      paperCounter--;
    });
  }

  void _plusPaperCounter() {
    setState(() {
      paperCounter++;
    });
  }

  void _minusPlasticCounter() {
    setState(() {
      plasticCounter--;
    });
  }

  void _plusPlasticrCounter() {
    setState(() {
      plasticCounter++;
    });
  }

  void _minusBatteriesCounter() {
    setState(() {
      batteriesCounter--;
    });
  }

  void _plusBatteriesCounter() {
    setState(() {
      batteriesCounter++;
    });
  }

  void _minusElectronicrCounter() {
    setState(() {
      electronicCounter--;
    });
  }

  void _plusElectronicCounter() {
    setState(() {
      electronicCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          const Logo(),
          trackButton(
              "Glass", glassCounter, _minusGlassCounter, _plusGlassCounter),
          trackButton("Plastic", plasticCounter, _minusPlasticCounter,
              _plusPlasticrCounter),
          trackButton("Batteries", batteriesCounter, _minusBatteriesCounter,
              _plusBatteriesCounter),
          trackButton("Electronic", electronicCounter, _minusElectronicrCounter,
              _plusElectronicCounter),
          trackButton(
              "Paper", paperCounter, _minusPaperCounter, _plusPaperCounter),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: button(
                  text: "Save",
                  onPressed: () {
                    print("save");
                  })),
        ],
      ),
    ));
  }
}

Widget trackButton(String name, counter, decrease, increase) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(name, style: const TextStyle(fontSize: 30)),
      IconButton(
        icon: const Icon(
          Icons.remove_circle_outline,
          size: 30,
          color: Colors.red,
        ),
        onPressed: decrease,
      ),
      Text('$counter',
          style: const TextStyle(color: Colors.green, fontSize: 30)),
      IconButton(
        icon:
            const Icon(Icons.add_circle_outline, size: 30, color: Colors.green),
        onPressed: increase,
      )
    ],
  );
}
