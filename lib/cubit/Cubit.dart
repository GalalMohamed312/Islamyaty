
import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamyat/cubit/states.dart';
import 'package:islamyat/screens/Audio.dart';
import 'package:islamyat/screens/Prayer.dart';
import 'package:islamyat/screens/quran/Quran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home.dart';
import '../utils/constants.dart';


class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
     const Home(),
    const Quran(),
    const Prayer(),
    const Audio(),
    // const Shop(),
  ];
  List<String>titles=[
    'Home',
    'Community',
    'Tracking',
    'Learning',
    // 'Shop',
  ];
List<TabItem> screenItems=[
  const TabItem(icon:Icon(
    Icons.home_outlined,
    color: Colors.grey,
  ),
  title:'Home' ),
   TabItem(icon: Image.asset("assets/images/QuranIcon.jpeg",color:Colors.white60,fit: BoxFit.cover,),
      title:'Quran'),
   TabItem(icon:Image.asset("assets/images/mosqueIcon.jpeg",color: Colors.white60,),
      title:'Prayer' ),
   TabItem(icon: Image.asset("assets/images/Audio.jpeg",color: Colors.white60,),
      title:'Audio' ),
];
void changeIndex(int index){
  currentIndex=index;
  emit(HomeChangeBottomNavBarState());
}

  List arabic =[];
  List malayalam =[];
  List quran =[];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =ItemPositionsListener.create();
  Future readJson ()async{
    final String response =await rootBundle.loadString("assets/fonts/hafs_smart_v8.json");
    final data=json.decode(response);
    arabic=data["quran"];
    print(arabic);
    malayalam=data["malayalam"];
    return quran=[arabic,malayalam];
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
}