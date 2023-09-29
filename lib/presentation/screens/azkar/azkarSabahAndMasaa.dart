import 'dart:ffi';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

import 'package:location/location.dart';

import '../../../data/db/azkarDB.dart';
import '../../utils/navigator.dart';
import 'azkar.dart';

class AzkarSabahAndMasaa extends StatefulWidget {
   AzkarSabahAndMasaa({Key? key,required this.isMasaa}) : super(key: key);
  bool isMasaa;
  @override
  State<AzkarSabahAndMasaa> createState() => _AzkarSabahAndMasaaState();
}

class _AzkarSabahAndMasaaState extends State<AzkarSabahAndMasaa> {
  int count=0;
  int i=0;
  var azkarSabah=AzkarDB.listAzkarSabah;
  var azkarMasaa=AzkarDB.listAzkarMasaa;
  @override

  void initState() {
    super.initState();
    if (widget.isMasaa) {
      AzkarDB.getAllMasaa();
    }
    else {
      AzkarDB.getAllSabah();
    }
  }
  @override
  Widget build(BuildContext context) {
    if(!widget.isMasaa){
      for( ;i<azkarSabah.length;){
        if(count>=int.parse(azkarSabah[i].count!)){
          count=0;
          i++;
          continue;
        }
        else {
          return Scaffold(
              backgroundColor:AppColors.backgroundLight,
              body:
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                        Expanded(
                          child: ListView(shrinkWrap: true,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(AppSize.s10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(AppSize.s20)
                                  ),
                                  child: Text("${azkarSabah[i].zekr}",
                                      textAlign: TextAlign.center,
                                      style:textStyleBold(fontSize: AppSize.s20))),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                          azkarSabah[i].description!.isNotEmpty ?
                          Container(
                            padding: const EdgeInsets.all(AppSize.s10),
                            // color: AppColors.primaryColor,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(AppSize.s20)
                            ),
                            child: Text("${azkarSabah[i].description}",
                                textAlign: TextAlign.center,
                                style:textStyleBold(fontSize: AppSize.s20))): const SizedBox(height:0,),
                      azkarSabah[i].description!.isNotEmpty ?const SizedBox(height: 20,):const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width:AppSize.s100,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(AppSize.s10)
                                ),
                                child: Text("${azkarSabah[i].count}",textAlign: TextAlign.center,style:textStyleBold(fontSize: AppSize.s20))),
                            const SizedBox(width: 40,),
                            Container(
                                width:AppSize.s100,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(AppSize.s10)
                                ),
                                child: Text("$count",textAlign: TextAlign.center,style: textStyleBold(fontSize: AppSize.s20))),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {
                              setState(() {
                                count++;
                              });
                            },child: const Icon(Icons.add_circle_outline,color: AppColors.primaryColor,)),

                            TextButton(onPressed: () {
                              setState(() {
                                if(count>0) {
                                  count--;
                                }
                              });
                            },child: const Icon(Icons.remove_circle_outline,color: AppColors.primaryColor,)),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                count=int.parse(azkarSabah[i].count!);
                              });
                            }, child:  const Text("التالي",textAlign: TextAlign.center,),),

                          ],
                        ),
                      SizedBox(height: 20,),
                      ],
                    ),
                ),
                ),

          );
        }
      }
      AppNavigator.pop(context: context);
      return const Scaffold(
        backgroundColor: AppColors.background,
      );
    }
    else{
      for( ;i<azkarMasaa.length;){
        if(count>=int.parse(azkarMasaa[i].count!)){
          count=0;
          i++;
          continue;
        }
        else {
          return Scaffold(
            backgroundColor:AppColors.backgroundLight,
            body:
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(AppSize.s10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(AppSize.s20)
                          ),
                          child: Text("${azkarMasaa[i].zekr}",
                              textAlign: TextAlign.center,
                              style:textStyleBold(fontSize: AppSize.s20))),
                    ),
                    const SizedBox(height: 20,),
                    azkarMasaa[i].description!.isNotEmpty ?
                    Container(
                        padding: const EdgeInsets.all(AppSize.s10),
                        // color: AppColors.primaryColor,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(AppSize.s20)
                        ),
                        child: Text("${azkarMasaa[i].description}",
                            textAlign: TextAlign.center,
                            style:textStyleBold(fontSize: AppSize.s20))): const SizedBox(height:0,),
                    azkarMasaa[i].description!.isNotEmpty ?const SizedBox(height: 20,):const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width:AppSize.s100,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(AppSize.s10)
                            ),
                            child: Text("${azkarMasaa[i].count}",textAlign: TextAlign.center,style:textStyleBold(fontSize: AppSize.s20))),
                        const SizedBox(width: 40,),
                        Container(
                            width:AppSize.s100,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(AppSize.s10)
                            ),
                            child: Text("$count",textAlign: TextAlign.center,style: textStyleBold(fontSize: AppSize.s20))),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {
                          setState(() {
                            count++;
                          });
                        },child: const Icon(Icons.add_circle_outline,color: AppColors.primaryColor,)),

                        TextButton(onPressed: () {
                          setState(() {
                            if(count>0) {
                              count--;
                            }
                          });
                        },child: const Icon(Icons.remove_circle_outline,color: AppColors.primaryColor,)),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            count=int.parse(azkarMasaa[i].count!);
                          });
                        }, child:  const Text("التالي",textAlign: TextAlign.center,),),

                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),

          );
        }
      }
      AppNavigator.pop(context: context);
      return const Scaffold(
        backgroundColor: AppColors.background,
      );
    }

  }

}

