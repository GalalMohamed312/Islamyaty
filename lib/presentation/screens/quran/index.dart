import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyat/presentation/screens/quran/search.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';

import '../../../cubit/Cubit.dart';
import '../../../cubit/states.dart';
import '../../utils/constants.dart';
import '../../utils/navigator.dart';
import 'arabic_sura_number.dart';
import 'mydrawer.dart';
import 'surah_builder.dart';



class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    // TODO: implement initState
    print("test=");
    _runFilter("النس");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (BuildContext context,HomeStates state){},
      builder: (BuildContext context,HomeStates state){
        var cubit=HomeCubit.get(context);
        return   Scaffold(
          floatingActionButton: FloatingActionButton(
            tooltip: 'Go to bookmark',
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.bookmark),
            onPressed: () async {
              fabIsClicked = true;
              // if (await cubit.readBookmark() == true)
                  {
                AppNavigator.push(context: context, screen: SurahBuilder(
                  arabic: cubit.quran[0],
                  sura: bookmarkedSura - 1,
                  suraName: arabicName[bookmarkedSura - 1]['name'],
                  ayah: bookmarkedAyah,
                ));
              }
            },
          ),
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                AppNavigator.push(context: context, screen: const Search());
              },
              icon: const Icon(Icons.search_outlined,color: AppColors.white,),
            ),
            title: const Text(
              "القرآن الكريم",
            ),
          ),
          body: FutureBuilder(
            future: cubit.readQuranJson(),
            builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
                ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return indexCreator(snapshot.data, context);
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          ),
        );
      },
    );

  }
void _runFilter(String enter){
  List<Map<dynamic,dynamic>>result=[];
  if(enter.isEmpty){
    result=arabicName;
  }
  else{
    result = arabicName
        .where((element) => element["name"].contains(enter))
        .toList();
    result.forEach((element) {
      print(element);
    });
    // result= arabicName.where((element) => element[0]["name"].contains(enter.toLowerCase()));
  }
}

  ListView indexCreator(quran, context) {

    return ListView(
      children: [
        for (int i = 0; i < 114; i++)
          Container(
            color: i % 2 == 0
                ? AppColors.backgroundLight
                : AppColors.background,
            child: TextButton(
              child: Row(
                children: [
                  ArabicSuraNumber(i: i),
                  const Spacer(),
                  Text(
                    arabicName[i]['name'],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontFamily: 'quran',
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color:AppColors.darkGray,
                          )
                        ]),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              onPressed: () {
                fabIsClicked = false;
              AppNavigator.push(context: context, screen:SurahBuilder(
                arabic: quran[0],
                sura: i,
                suraName: arabicName[i]['name'],
                ayah: 0,
              ));
              },
            ),
          ),
      ],
    );
  }


}





