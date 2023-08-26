import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamyat/onBoarding/onBoarding.dart';
import 'package:islamyat/utils/navigator.dart';

import '../layout/layoutScreen.dart';
import '../network/cache_helper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Widget? startScreen;
  @override
  void initState() {
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
          body: Stack(
            children: [
              const Center(
                child: Text("Islamyat",style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                ),),
              ),
              Positioned(
                bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset("assets/images/mosque.png")),
            ],
          ),
        ));
  }
}
