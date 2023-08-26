import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamyat/layout/layoutScreen.dart';
import 'package:islamyat/utils/media_query_values.dart';
import 'package:islamyat/utils/navigator.dart';

import '../network/cache_helper.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: IntroductionScreen(
        pages: [
          onBoardingPageView(title:"Read Quran",imageURL: "assets/images/readQuranBoy.jpeg",context: context,text: "Read Quran and listen for different audio" ),
          onBoardingPageView(title:"Prayer alert",imageURL: "assets/images/prayerTime.jpeg" ,context: context,text: "reminder to praying time"),
          onBoardingPageView(title:"calculate zakat",imageURL: "assets/images/zakat.jpeg" ,context: context,text: ""),
        ],
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        skip: const Text("Skip",style: TextStyle(
          color: Colors.amber
        )),
        next: const Text("Next",style: TextStyle(
            color: Colors.amber
        )),
        done: const Text("Done", style: TextStyle(
            fontWeight: FontWeight.w700,
          color: Colors.amber
        )),

        onDone: () {
          CacheHelper.saveData(key: 'onBoarding', value: true);
          // On Done button pressed
          AppNavigator.navigationAndFinish(context: context, screen: Layout());
        },
        onSkip: () {
          CacheHelper.saveData(key: 'onBoarding', value: true);
          // On Skip button pressed
          AppNavigator.navigationAndFinish(context: context, screen: Layout());
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          ),
        ),
      ),
    ));
  }
  PageViewModel onBoardingPageView({required String title,required String imageURL,required BuildContext context,required String text}){
    return PageViewModel(
      title:title,
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,textAlign: TextAlign.center,style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey
            ),),
          ),
    Center(child: Image.asset(imageURL,fit: BoxFit.fill,width: double.infinity),
    )],
      ),
      // image:  Center(child: Image.asset(imageURL,fit: BoxFit.fitWidth,width: double.infinity))
    );
  }
}
