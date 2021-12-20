import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ProcessingMap extends StatefulWidget {
  @override
  _ProcessingMap createState() => _ProcessingMap();
}

class _ProcessingMap extends State<ProcessingMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(55.7499, 37.6262),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("©Ecology app");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.75264, 37.67136),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('Сфера Экологии');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7565022, 37.6132515),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ТОЧКА ПРИЕМА БАТАРЕЕК В СЕТИ СУПЕРМАРКЕТОВ "АЗБУКА ВКУСА"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.78998, 37.53112),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'Пункт приема вторсырья в магазине IKEA Сити ТЦ Авиапарк');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7569531, 37.6154066),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПРИЕМ ОБУВИ В МАГАЗИНЕ RENDEZ-VOUS');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.75549, 37.6121197),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'КОНТЕЙНЕР ДЛЯ ПРИЕМА ОДЕЖДЫ "ВТОРОЕ ДЫХАНИЕ" В МАГАЗИНЕ "UNIQLO"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7618074, 37.6219226),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПУНКТ ПРИЕМА ЭЛЕКТРОТЕХНИКИ В МАГАЗИНЕ МВИДЕО');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.754041, 37.6371923),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПУНКТ ПРИЕМА ОТРАБОТАННЫХ РТУТЬСОДЕРЖАЩИХ ЛАМП № 5');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(5.7676865, 37.5988441),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ПУНКТ ПРИЕМА ЭЛЕКТРОНИКИ В СЕРВИСНОМ ЦЕНТРЕ SAMSUNG');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7532237, 37.5768836),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ТОЧКА ПРИЕМА ВТОРСЫРЬЯ В АКАДЕМИИ "LAIMALUX"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7436717, 37.6263753),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ТОЧКА ПРИЕМА БАТАРЕЕК В СЕТИ СУПЕРМАРКЕТОВ "АЗБУКА ВКУСА"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7424408, 37.6292567),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ТОЧКА ПРИЕМА КРЫШЕЧЕК И БАТАРЕЕК В МАГАЗИНЕ "ВКУСВИЛЛ"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7341539, 37.616774),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ТОЧКА ПРИЕМА БАТАРЕЕК В МАГАЗИНЕ ВКУСВИЛЛ');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.73151, 37.6348783),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'КОНТЕЙНЕР ДЛЯ ПРИЕМА БАНОЧКИ ИЗ-ПОД ПРОДУКЦИИ ЭВАЛАР В АПТЕКЕ "ЭВАЛАР"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.727668, 37.6354914),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ТОЧКА ПРИЕМА БАТАРЕЕК В МАГАЗИНЕ "КОМУС"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.726224, 37.6404153),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПУНКТ ПРИЕМА УТИЛЬНЫХ ШИН "ЭКО-ФОНД"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7291717, 37.6165749),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ТОЧКА ПРИЕМА ЗУБНЫХ ЩЕТОК В МАГАЗИНЕ ПЕРЕКРЕСТОК');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7317795, 37.6619088),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПРИЕМ СТАРЫХ ТЕЛЕФОНОВ В САЛОНЕ "TELE2"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7401256, 37.6566117),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ПУНКТ ПРИЕМА ЭЛЕКТРОТЕХНИКИ И БАТАРЕЕК В МАГАЗИНЕ МВИДЕО');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.737893, 37.6846549),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ТОЧКА ПРИЕМА КРЫШЕЧЕК И БАТАРЕЕК В МАГАЗИНЕ "ВКУСВИЛЛ"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7520439, 37.668759),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПУНКТ ПРИЁМА PHARMA-ECOBOX');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7446675, 37.563705),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПУНКТ ПРИЕМА СТАРОЙ ПОСУДЫ В МАГАЗИНЕ "FISSMAN"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7430872, 37.5645417),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ТПРИЕМ СТАРЫХ ТЕЛЕФОНОВ В САЛОНЕ "TELE2"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.743342, 37.5477784),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ТОЧКА ПРИЕМА БАТАРЕЕК В МАГАЗИНЕ ВКУСВИЛЛ');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7446675, 37.563705),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ТОЧКА ПРИЕМА БАТАРЕЕК И ЗУБНЫХ ЩЕТОК В МАГАЗИНЕ ПЕРЕКРЕСТОК');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7585695, 37.5441293),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ТОЧКА ПРИЕМА БАТАРЕЕК И ЗУБНЫХ ЩЕТОК В МАГАЗИНЕ ПЕРЕКРЕСТОК');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.758237, 37.5274013),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print('ПУНКТ ПРИЕМА УТИЛЬНЫХ ШИН "ЭКО-ФОНД"');
                  },
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(55.7438993, 37.5062641),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: () {
                    print(
                        'ПУНКТ ПРИЕМА ЭЛЕКТРОТЕХНИКИ И БАТАРЕЕК В МАГАЗИНЕ МВИДЕО');
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
