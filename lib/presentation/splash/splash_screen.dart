import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/assets.dart';

import '../../data/network/cache_helper.dart';
import '../../layout/layoutScreen.dart';
import '../onBoarding/onBoarding.dart';
import '../utils/navigator.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Widget? startScreen;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    if (CacheHelper.getData(key: 'onBoarding') == true) {
      startScreen = const Layout();
    } else {
      startScreen = const OnBoarding();
    }
    Timer(const Duration(seconds: 3),()=>AppNavigator.pushAndRemove(context: context, screen:startScreen!));
  }
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Center(child: Image.asset(ImageAssets.splashLogo)),
        ));
  }
}
