

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islamyat/presentation/qiblah/qiblah.dart';

class QiblahCheckAvailable extends StatelessWidget {
  const QiblahCheckAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return Scaffold(
    body: FutureBuilder(future:_deviceSupport ,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          print("Error: ${snapshot.error.toString()}");
          return Center(
            child: Text("Error: ${snapshot.error.toString()}"),
          );
        }
        if (snapshot.data!) {
          return const QiblahCompass();
        }
        else {
          return const Center(
            child: Text("Your device is not supported"),
          );
        }
      },

    )

);
  }
}
