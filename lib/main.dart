import 'package:flutter/material.dart';
import 'package:islamyat/presentation/splash/splash_screen.dart';

import 'app/app.dart';
import 'data/network/cache_helper.dart';
import 'data/network/dio_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp( MyApp());
}


