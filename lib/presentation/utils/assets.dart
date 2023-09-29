
import 'package:flutter/material.dart';
import 'package:islamyat/layout/layoutScreen.dart';
import 'package:islamyat/presentation/onBoarding/onBoarding.dart';
import 'package:islamyat/presentation/screens/azkar/azkar.dart';
import 'package:islamyat/presentation/screens/hadith/Ahadith.dart';
import 'package:islamyat/presentation/screens/quran/Quran.dart';
import 'package:islamyat/presentation/splash/splash_screen.dart';

abstract class ImageAssets {
 static const String splashLogo="assets/images/logo.png";
 static const String mosque="assets/images/mosque.jpg";
 static const String hadithWindow="assets/images/grey.svg";
 static const String onBoarding1="assets/images/readQuranBoy.png";
 static const String onBoarding2="assets/images/prayerTime.png";
 static const String onBoarding3="assets/images/zakat.png";
 static const String compass="assets/images/compass.svg";
 static const String needle="assets/images/needle.svg";


}


abstract class JsonAssets {
 static const String moshafHafs="assets/json/hafs_smart_v8.json";

}