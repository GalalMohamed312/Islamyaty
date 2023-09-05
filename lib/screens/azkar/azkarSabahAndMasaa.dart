import 'dart:ffi';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:islamyat/db/azkarDB.dart';
import 'package:islamyat/utils/navigator.dart';
import 'package:location/location.dart';

import 'azkar.dart';

class AzkarSabahAndMasaa extends StatefulWidget {
   AzkarSabahAndMasaa({Key? key,required this.isMasaa}) : super(key: key);
  bool isMasaa;
  @override
  State<AzkarSabahAndMasaa> createState() => _AzkarSabahAndMasaaState();

  // void initState(){
  //   if(isMasaa) {
  //     print("get al ");
  //     AzkarDB.getAllMasaa();
  //   }
  //   else {
  //     print("get al data");
  //     AzkarDB.getAllSabah();
  //   }
  // }
}

class _AzkarSabahAndMasaaState extends State<AzkarSabahAndMasaa> {
  int count=0;
  int i=0;
  var azkarSabah=AzkarDB.listAzkarSabah;
  var azkarMasaa=AzkarDB.listAzkarMasaa;
  @override
  void initState() {
    super.initState();
    if (widget.isMasaa) {
      AzkarDB.getAllMasaa();
    }
    else {
      AzkarDB.getAllSabah();
    }
  }
  @override
  Widget build(BuildContext context) {
    if(!widget.isMasaa){
      for( ;i<azkarSabah.length;){
        if(count>=int.parse(azkarSabah[i].count!)){
          print("count=$count");
          print("$count");
          print("i=$i");
          print("azkar=${azkarSabah[i].count}");
          count=0;
          i++;
          continue;
          // return;
          // return Container();
        }
        else {
          return Scaffold(
              backgroundColor:  Color.fromARGB(255, 253, 247, 230),
              body:
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // textDirection: TextDirection.RTL,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${azkarSabah[i].zekr}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${azkarSabah[i].count}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          const SizedBox(width: 80,),
                          Text("$count",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          TextButton(onPressed: () {
                            // count=count+1;
                            print(count);
                            setState(() {
                              count++;
                            });
                          },child: const Text("add"),),
                          const SizedBox(width: 80,),
                          TextButton(onPressed: () {
                            // count=count+1;
                            print(count);
                            setState(() {
                              count=int.parse(azkarSabah[i].count!);
                            });
                          },child: const Text("skip"),),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        }
      }
      AppNavigator.pop(context: context);
      return const Scaffold();
    }
    else{
      print(azkarMasaa.length);
      print(azkarSabah.length);
      for( ;i<azkarMasaa.length;){
        if(count>=int.parse(azkarMasaa[i].count!)){
          count=0;
          i++;
          continue;
        }
        else {
          return Scaffold(
              backgroundColor:  const Color.fromARGB(255, 253, 247, 230),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${azkarMasaa[i].zekr}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${azkarMasaa[i].count}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          const SizedBox(width: 80,),
                          Text("$count",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          TextButton(onPressed: () {
                            // count=count+1;
                            print(count);
                            setState(() {
                              count++;
                            });
                          },child: const Text("add"),),
                          const SizedBox(width: 80,),
                          TextButton(onPressed: () {
                            // count=count+1;
                            print(count);
                            setState(() {
                              count=int.parse(azkarMasaa[i].count!);
                            });
                          },child: const Text("skip"),),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        }
      }
      AppNavigator.pop(context: context);
      return const Scaffold();
    }

  }

}

