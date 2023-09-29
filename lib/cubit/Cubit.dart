
import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamyat/cubit/states.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/screens/azkar/azkar.dart';
import '../presentation/screens/hadith/Ahadith.dart';
import '../presentation/screens/home.dart';
import '../presentation/screens/quran/Quran.dart';
import '../presentation/utils/constants.dart';
import '../presentation/utils/assets.dart';



class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
     const Home(),
    const Quran(),
    const Azkar(),
    const AllAhadithScreen(),
    // const Shop(),
  ];

List<TabItem> screenItems=[
  const TabItem(icon:Icon(
    Icons.home_outlined,
    color: AppColors.background,
  ),
  title:'الرئيسيه' ),
   TabItem(icon: Image.asset("assets/images/quraniconimage.png",color:AppColors.background,fit: BoxFit.cover,),
      title:'القرآن'),
   TabItem(icon:Image.asset("assets/images/doaa.png",color: AppColors.background,),
      title:'أذكار' ),
   TabItem(icon: Image.asset("assets/images/tauhid.png",color: AppColors.background,),
      title:'أحاديث' ,),
];
void changeIndex(int index){
  currentIndex=index;
  emit(HomeChangeBottomNavBarState());
}


  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =ItemPositionsListener.create();

  List arabic =[];
  List quran =[];
  Future readQuranJson ()async{
    final String response =await rootBundle.loadString(JsonAssets.moshafHafs);
    final data=json.decode(response);
    arabic=data["quran"];
    return quran=[arabic];
  }
  bool view = true;
  void changeView(){
    view=!view;
    emit(ChangeViewState());
  }

  jumbToAyah(ayah) {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index:ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }

  Future saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
    await prefs.setInt('mushafFontSize', mushafFontSize.toInt());
  }

  Future getSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
      mushafFontSize = await prefs.getInt('mushafFontSize')!.toDouble();
    } catch (_) {
      arabicFontSize = 28;
      mushafFontSize = 40;
    }
  }

  saveBookMark (surah,ayah)async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setInt("surah", surah);
    await prefs.setInt("ayah", ayah);
  }

  readBookmark() async {
    print("read book mark called");
    try  {
      final  prefs = await SharedPreferences.getInstance();
      bookmarkedAyah = prefs.getInt('ayah')!;
      print("before $bookmarkedSura");
      bookmarkedSura = prefs.getInt('surah')!;
      print("after $bookmarkedSura");
      return true;
    }
    catch(e){
      return false;
    }
  }

  bool showTafseer=false;
  void changeShowTafsser(){
    showTafseer=!showTafseer;
    emit(ChangeTafseerState());
  }
  List azkar =[];
  Future readAzkarJson ()async{
    final String response =await rootBundle.loadString("assets/json/azkar.json");
    final data=json.decode(response);
    azkar=data;
    print(azkar[0]);
    return azkar;
  }
}