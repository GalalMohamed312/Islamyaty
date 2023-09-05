
import 'package:flutter/material.dart';

abstract class TextApp {
 static const Text splashScreen= Text("ألاربعون النوويه"
  ,style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,fontSize: 36),);

 static const Text topHomeScreen= Text("ألاربعون النوويه",textDirection: TextDirection.rtl
  ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),);
 static const Text headerHomeScreen= Text("لحفظ وسماع الاحاديث النوويه"
  ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24),);


 static const Text bookOneScreen=Text("ألأحاديث الاربعون");
 static const Text bookTwoScreen= Text("ألأستماع للأحاديث");
 static const Text bookThreeScreen= Text("ألأحاديث المحفوظه");
}