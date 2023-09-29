
import 'package:flutter/material.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

abstract class TextApp {
 static const String azkar="أذكار";
 static const String azkarSabAh="أذكار الصباح";
 static const String azkarMasaa="أذكار المساء";
 static const String onBoardingTitle1= "القرآن الكريم";
 static const String onBoardingTitle2="الصلاة";
 static const String onBoardingTitle3="الزكاة";
 static const String onBoardingSubTitle1= "لحفظ وتلاوة القرآن الكريم وقراءة الاربعون النوويه وقراءة الاذكار ";
 static const String onBoardingSubTitle2="تذكير بمواقيت الصلاة وإتجاه القبلة";
 static const String onBoardingSubTitle3="حساب زكاة المال";

 static const Text splashScreen= Text("الأربعون النوويه"
  ,style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,fontSize: 36),);

 static  Text topHomeScreen= Text("الأربعون النوويه",textDirection: TextDirection.rtl
  ,style:textStyleBold(color: AppColors.white,fontSize: AppSize.s30));
 static const Text headerHomeScreen= Text("لحفظ وسماع الاحاديث النوويه"
  ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24),);


 static const Text bookOneScreen=Text("ألأحاديث الاربعون");
 static const Text bookTwoScreen= Text("ألأستماع للأحاديث");
 static const Text bookThreeScreen= Text("ألأحاديث المحفوظه");
}