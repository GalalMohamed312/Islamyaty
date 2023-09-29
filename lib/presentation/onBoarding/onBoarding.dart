import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamyat/layout/layoutScreen.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/app_strings.dart';
import 'package:islamyat/presentation/utils/assets.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

import '../../data/network/cache_helper.dart';
import '../utils/navigator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
      body: IntroductionScreen(
        pages: [
          onBoardingPageView(title:TextApp.onBoardingTitle1,imageURL: ImageAssets.onBoarding1,context: context,text: TextApp.onBoardingSubTitle1 ),
          onBoardingPageView(title:TextApp.onBoardingTitle2,imageURL: ImageAssets.onBoarding2 ,context: context,text: TextApp.onBoardingSubTitle2),
          onBoardingPageView(title:TextApp.onBoardingTitle3,imageURL: ImageAssets.onBoarding3 ,context: context,text: TextApp.onBoardingSubTitle3),
        ],
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        skip:  Text("تجاوز",style:textStyleRegular(color: AppColors.primaryColor) ),
        next:  Text("التالي",style:textStyleRegular(color: AppColors.primaryColor) ),
        done:  Text("إنهاء", style:textStyleRegular(color: AppColors.primaryColor) ),
        autoScrollDuration: 3000,
        infiniteAutoScroll: true,
        rtl: true,
        curve: Curves.bounceInOut,

        onDone: () {
          CacheHelper.saveData(key: 'onBoarding', value: true);
          // On Done button pressed
          AppNavigator.navigationAndFinish(context: context, screen: const Layout());
        },
        onSkip: () {
          CacheHelper.saveData(key: 'onBoarding', value: true);
          // On Skip button pressed
          AppNavigator.navigationAndFinish(context: context, screen: const Layout());
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(AppSize.s20, AppSize.s10),
          activeColor:AppColors.primaryColor,
          color: AppColors.gray,
          spacing: const EdgeInsets.symmetric(horizontal: AppSize.s2),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s24)
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
            child: Text(text,textAlign: TextAlign.center,textDirection: TextDirection.rtl,style:textStyleRegular(fontSize: AppSize.s16,color: AppColors.gray) ),
          ),
    Center(child: Image.asset(imageURL,fit: BoxFit.fill,width: double.infinity),
    )],
      ),
      // image:  Center(child: Image.asset(imageURL,fit: BoxFit.fitWidth,width: double.infinity))
    );
  }
}
