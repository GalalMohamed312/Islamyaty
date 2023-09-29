
import 'package:flutter/material.dart';
import 'package:islamyat/layout/layoutScreen.dart';
import 'package:islamyat/presentation/onBoarding/onBoarding.dart';
import 'package:islamyat/presentation/screens/azkar/azkar.dart';
import 'package:islamyat/presentation/screens/hadith/Ahadith.dart';
import 'package:islamyat/presentation/screens/quran/Quran.dart';
import 'package:islamyat/presentation/splash/splash_screen.dart';

abstract class Routes {
 static const String splashRoute="/";
 static const String onBoardingRoute="/onBoarding";
 static const String qiblahRoute="/qiblah";
 static const String azkarRoute="/azkar";
 static const String viewZikrRoute="/viewZikr";
 static const String sabahAndMasaaRoute="/sabahAndMasaa";
 static const String quranRoute="/quran";
 static const String hadithRoute="/hadith";
 static const String showHadithRoute="/showHadith";
 static const String homeRoute="/home";
 static const String prayerTimeRoute="/prayerTime";
}

class RouteGenerator{
 static Route<dynamic>getRoute(RouteSettings settings){
  switch(settings.name){
   case Routes.splashRoute:
    return  MaterialPageRoute(
     builder: (context) => const Splash());
   case Routes.onBoardingRoute:
    return  MaterialPageRoute(
        builder: (context) => const OnBoarding());
   case Routes.homeRoute:
    return  MaterialPageRoute(
        builder: (context) => const Layout());
   case Routes.quranRoute:
    return  MaterialPageRoute(
        builder: (context) => const Quran());
   case Routes.hadithRoute:
    return  MaterialPageRoute(
        builder: (context) => const AllAhadithScreen());
   case Routes.azkarRoute:
    return  MaterialPageRoute(
        builder: (context) => const Azkar());
   default:
    return unDefinedRoute();
  }
 }

 static Route<dynamic>unDefinedRoute(){
  return MaterialPageRoute(builder: (_)=>Scaffold(
   appBar: AppBar(
    title: const Text("no Route"),
   ),
  ));
 }
}