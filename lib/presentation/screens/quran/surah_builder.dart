import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyat/app/app.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../cubit/Cubit.dart';
import '../../../cubit/states.dart';
import '../../utils/constants.dart';
import '../../utils/font_manager.dart';
import '../../utils/styles_manager.dart';




class SurahBuilder extends StatelessWidget {
  final sura;
  final arabic;
  final suraName;
  int ayah;

  SurahBuilder(
      {Key? key, this.sura, this.arabic, this.suraName, required this.ayah})
      : super(key: key);
  // bool view = true;

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SafeArea singleSuraBuilder(lengthOfSura,cubit) {
    String fullSura = '';
    int previousVerses = 0;
    if (sura + 1 != 1) {
      for (int i = sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!cubit.view) {
      for (int i = 0; i < lengthOfSura; i++) {
        fullSura += (arabic[i + previousVerses]['aya_text']);
      }
    }
    return SafeArea(
      child: Container(
        color: AppColors.background,
        child: cubit.view
            ? ScrollablePositionedList.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                (index != 0) || (sura == 0) || (sura == 8)
                    ? const Text('')
                    : const ReturnBasmala(),
                Container(
                  color: index % 2 != 0

                      ? AppColors.background
                      : AppColors.backgroundLight,
                  child: PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: verseBuilder(index, previousVerses),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            cubit.saveBookMark(sura + 1, index);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.bookmark_add,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Bookmark'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {

                          },
                          child: const Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.share,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Share'),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            );
          },
          itemScrollController: cubit.itemScrollController,
          itemPositionsListener: cubit.itemPositionsListener,
          itemCount: lengthOfSura,
        )
            : ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sura + 1 != 1 && sura + 1 != 9
                          ? const ReturnBasmala()
                          : const Text(''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          fullSura, //mushaf mode
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: mushafFontSize,
                            fontFamily: arabicFont,
                            color:AppColors.lightBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = noOfVerses[sura];
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..jumbToAyah(ayah),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              leading: Tooltip(
                message: 'Mushaf Mode',
                child: TextButton(
                  child: const Icon(
                    Icons.chrome_reader_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    cubit.changeView();
                  },
                ),
              ),
              title: Text(
                // widget.
                suraName,
                textAlign: TextAlign.center,
              ),
            ),
            body: singleSuraBuilder(lengthOfSura,cubit),
          );
        },
      ),
    );
  }
}


class ReturnBasmala extends StatelessWidget {
  const ReturnBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
       Center(
        child: Text(
          'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
          style:textStyleSemiBold(color: AppColors.black,fontSize: AppSize.s30,fontFamily: FontConstant.fontFamily),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
