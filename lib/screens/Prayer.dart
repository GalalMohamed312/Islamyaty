import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class Prayer extends StatefulWidget {
  const Prayer({Key? key}) : super(key: key);

  @override
  State<Prayer> createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  Location location = Location();
  LocationData? _locationData;
  double? longitude,latitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getLocation(),
          builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final coordinates=Coordinates( 30.06263,31.24967);
          final param=CalculationMethod.Egyptian();
          param.madhab=Madhab.Hanafi;
          // print(DateFormat('yyyy-M-d').format(DateTime.now()));
          // final formatedDate=DateFormat('yyyy-M-d').format(DateTime.now());
          PrayerTimes prayerTimes=PrayerTimes(coordinates,DateTime.now(),param);

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Fajr  ',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(add3HoursToTime(DateFormat.jm().format(prayerTimes.fajr!)),style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Text('duhr  ',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(add3HoursToTime(DateFormat.jm().format(prayerTimes.dhuhr!)),style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Text('3sr  ',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(add3HoursToTime(DateFormat.jm().format(prayerTimes.asr!)),style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Text('Maghrib  ',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(add3HoursToTime(DateFormat.jm().format(prayerTimes.maghrib!)),style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Text('3isha  ',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(add3HoursToTime(DateFormat.jm().format(prayerTimes.isha!)),style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          );
          } ,),
    );
  }
  String add3HoursToTime(String formattedTime) {
    DateFormat dateFormat = DateFormat.jm();
    DateTime time = dateFormat.parse(formattedTime);
    time = time.add(Duration(hours: 3));
    return dateFormat.format(time);
  }

  getLocation()async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }
}
