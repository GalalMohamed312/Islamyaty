
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyat/screens/azkar/azkarSabahAndMasaa.dart';
import 'package:islamyat/screens/azkar/viewZekr.dart';
import 'package:islamyat/screens/quran/arabic_sura_number.dart';
import 'package:islamyat/utils/navigator.dart';
import '../../cubit/Cubit.dart';
import '../../cubit/states.dart';
import '../../db/azkarDB.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 253, 251, 240),
            body:  Padding(
              padding: const EdgeInsets.only(top: 0,bottom: 0),
              child: SingleChildScrollView(
                // scrollDirection: ScrollDirection.,
                child: FutureBuilder(
                  //we call the method, which is in the folder db file database.dart
                    future: cubit.readAzkarJson(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            card(i: 0, text:"أذكار الصباح", screen:  AzkarSabahAndMasaa(isMasaa: false,)),
                            card(i: 1, text:"أذكار المساء", screen:  AzkarSabahAndMasaa(isMasaa: true,)),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cubit.azkar.length,
                              itemBuilder: (context,index){
                                return card(i: index+2, text: cubit.azkar[index]['category'], screen: ViewZekr(azkarModel: cubit.azkar[index]));
                              },
                              separatorBuilder: (context,index)=>const SizedBox(),

                            ),
                          ],
                        );
                      } else
                        {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),

          );
        },
      ),
    );

  }

  Widget card({required int i, required String text,required screen}){
    return Container(
      color: i % 2 == 0
          ? const Color.fromARGB(255, 253, 247, 230)
          : const Color.fromARGB(255, 253, 251, 240),
      child: TextButton(
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
             Expanded(
               child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                    fontFamily: 'quran',
                    shadows: [
                      Shadow(
                        offset: Offset(.5, .5),
                        blurRadius: 1.0,
                        color: Color.fromARGB(255, 130, 130, 130),
                      )
                    ]),
                textDirection: TextDirection.rtl,
            ),
             ),
            // const Spacer(),
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
