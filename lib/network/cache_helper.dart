import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_strings.dart';

class CacheHelper {


  static late SharedPreferences sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }



//************************


  static dynamic getData({required String key})
   {
    return sharedPreferences.get(key);

  }


  //*********************

  static Future<bool> saveData ({
    required String key ,
    required dynamic value ,
}) async
  {
     return await sharedPreferences.setBool(key,value);
  }
  //************************
  static Future<bool> removeData(
      {required String key})async{
   return await sharedPreferences.remove(key);
  }

}