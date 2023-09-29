import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:location/location.dart';

import '../utils/app_colors.dart';
import '../utils/values_manager.dart';



class Prayer extends StatelessWidget {

   Prayer({Key? key, this.locationData, this.longitude, this.latitude}) : super(key: key);
  // final Location location = Location();
   LocationData? locationData;
  final double? longitude,latitude;
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: getLocation(),
    //       builder:(context,snapshot){
    //       if(snapshot.connectionState==ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       }
          // else
          //   {
          // final coordinates=Coordinates(locationData?.latitude,locationData?.longitude);
          final coordinates=Coordinates( 30.06263,31.24967);
          final param=CalculationMethod.Egyptian();
          param.madhab=Madhab.Hanafi;
          // print(DateFormat('yyyy-M-d').format(DateTime.now()));
          // final formatedDate=DateFormat('yyyy-M-d').format(DateTime.now());
          PrayerTimes prayerTimes=PrayerTimes(coordinates,DateTime.now(),param);
          String currentSalah=prayerTimes.currentPrayer(date: DateTime.now());
          return Padding(
            padding: const EdgeInsets.all(AppSize.s10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                salahTime(name: '   :الفجر', time: prayerTimes.fajr!,is3sr: false,isCurrentSalah: currentSalah.startsWith('fajr')),
                const SizedBox(height: 10,),
                salahTime(name:'   :الظهر' , time:prayerTimes.dhuhr!,is3sr: false,isCurrentSalah: currentSalah.startsWith('dhuhr') ),
                const SizedBox(height: 10,),
                salahTime(name: '   :العصر', time:prayerTimes.asr! ,is3sr: true,isCurrentSalah: currentSalah.startsWith('asr')),
                const SizedBox(height: 10,),
                salahTime(name: '   :المغرب', time: prayerTimes.maghrib!,is3sr: false,isCurrentSalah: currentSalah.startsWith('maghrib')),
                const SizedBox(height: 10,),
                salahTime(name:'   :العشاء' , time: prayerTimes.isha!,is3sr: false,isCurrentSalah: currentSalah.startsWith('isha')),
                const SizedBox(height: 10,),

              ],
            ),
          );

          }


  String add3HoursToTime(String formattedTime,bool salah) {
    DateFormat dateFormat = DateFormat.jm();
    DateTime time = dateFormat.parse(formattedTime);
    if(salah){
      time = time.add(const Duration(hours: 2));
    }
    else {
      time = time.add(const Duration(hours: 3));
    }
    return dateFormat.format(time);
  }

  Widget salahTime({required String name,required DateTime time,required bool is3sr,required bool isCurrentSalah}){
    return Container(
      padding: const EdgeInsets.only(left: AppSize.s10,right: AppSize.s10),
      width: double.infinity,
      decoration: BoxDecoration(
          color:isCurrentSalah?AppColors.green :AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppSize.s20)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(add3HoursToTime(DateFormat.jm().format(time),is3sr),style:textStyleMedium(fontSize: AppSize.s24,)),
          const Spacer(),
           Text(name,style:textStyleBold(fontSize: AppSize.s24,color: AppColors.white)),
        ],
      ),
    );
  }
  // getLocation()async{
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //   // locationData = await location.getLocation();
  // }
}
