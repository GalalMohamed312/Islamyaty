import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cubit/Cubit.dart';
import '../../cubit/states.dart';
import '../../utils/constants.dart';




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
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }



  SafeArea SingleSuraBuilder(LenghtOfSura,cubit) {
    String fullSura = '';
    int previousVerses = 0;
    if (sura + 1 != 1) {
      for (int i = sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!cubit.view) {
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += (arabic[i + previousVerses]['aya_text']);
      }
    }
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: cubit.view
            ? ScrollablePositionedList.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                (index != 0) || (sura == 0) || (sura == 8)
                    ? const Text('')
                    : const RetunBasmala(),
                Container(
                  color: index % 2 != 0
                      ? const Color.fromARGB(255, 253, 251, 240)
                      : const Color.fromARGB(255, 253, 247, 230),
                  child: PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                color:
                                Color.fromARGB(255, 56, 115, 59),
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
                                color:
                                Color.fromARGB(255, 56, 115, 59),
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
          itemCount: LenghtOfSura,
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
                          ? const RetunBasmala()
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
                            color: const Color.fromARGB(196, 44, 44, 44),
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
    int LengthOfSura = noOfVerses[sura];
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
              centerTitle: true,
              title: Text(
                // widget.
                suraName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'quran',
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ]),
              ),
              backgroundColor: const Color.fromARGB(255, 56, 115, 59),
            ),
            body: SingleSuraBuilder(LengthOfSura,cubit),
          );
        },
      ),
    );
  }
}

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'fonts/me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
