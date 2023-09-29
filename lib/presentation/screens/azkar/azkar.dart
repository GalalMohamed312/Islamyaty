
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islamyat/presentation/screens/azkar/viewZekr.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/font_manager.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';

import '../../../data/db/azkarDB.dart';

import '../../utils/app_strings.dart';
import '../../utils/navigator.dart';
import '../../utils/values_manager.dart';
import '../quran/arabic_sura_number.dart';
import 'azkarSabahAndMasaa.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {

  @override
  void initState() {

    super.initState();
    AzkarDB.getAllAzkar();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(// centerTitle: true,
        title: const Text(TextApp.azkar),
      ),
      backgroundColor:AppColors.background,
      body:  SingleChildScrollView(
        // scrollDirection: ScrollDirection.,
        child: Column(
      children: [
      card(i: 0, text:TextApp.azkarSabAh, screen:  AzkarSabahAndMasaa(isMasaa: false,)),
      card(i: 1, text:TextApp.azkarMasaa, screen:  AzkarSabahAndMasaa(isMasaa: true,)),
      ListView.separated(
      shrinkWrap: true,
      // padding: EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),

      itemCount: AzkarDB.listAzkar.length,
      itemBuilder: (context,index){
        return card(i: index+2, text: AzkarDB.listAzkar[index].category!, screen: ViewZekr(azkarModel: AzkarDB.listAzkar[index]));
      },
      separatorBuilder: (context,index)=>const SizedBox(height: AppSize.s0,),

      ),
      ],
    ),
      ),

    );

  }

  Widget card({required int i, required String text,required screen}){
    return Container(
      color: i % 2 == 0
          ? AppColors.backgroundLight
          : AppColors.background,
      child: TextButton(
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
             Expanded(
               child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:textStyleRegular(color: AppColors.black,fontSize: AppSize.s30,fontFamily: FontConstant.fontFamily),
                textDirection: TextDirection.rtl,
            ),
             ),
            ArabicSuraNumber(i: i),
          ],
        ),
        onPressed: () {
       AppNavigator.push(context: context, screen: screen);
        },
      ),
    );
  }
}
