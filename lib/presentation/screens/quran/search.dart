import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyat/presentation/screens/quran/search.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/font_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

import '../../../cubit/Cubit.dart';
import '../../../cubit/states.dart';
import '../../utils/constants.dart';
import '../../utils/navigator.dart';
import '../../utils/styles_manager.dart';
import 'arabic_sura_number.dart';
import 'mydrawer.dart';
import 'surah_builder.dart';


var _controller=TextEditingController();
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<dynamic,dynamic>>allSura=[];
  List<dynamic>allAyah=[];
  // bool isSearch=true;
  int searchType=0;
  TextSelection _textSelection = const TextSelection.collapsed(offset: 0);
  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }


  void _setCursor() {
    _controller.selection = _textSelection;
  }
  @override
  void initState() {
    // TODO: implement initState
    allSura=arabicName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemFonts.includeFont("assets/fonts/HafsSmart_08.ttf");
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return   Scaffold(
            backgroundColor: AppColors.background,
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
                    return chooseSearchWay(snapshot.data, context);
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
      ),
    );

  }

  Widget chooseSearchWay(quran, context){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: (){
                setState(() {
                  searchType=1;
                });
              }, style: ElevatedButton.styleFrom(
                backgroundColor:searchType==1?AppColors.primaryColor: AppColors.background,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  side: const BorderSide(color:AppColors.primaryColor), // Set the border color here
                ),
              ),
                  child: Text("بحث بالآيه",style: textStyleRegular(color:searchType==1? AppColors.white:AppColors.black,fontSize: AppSize.s16),))),
              const SizedBox(width: 10,),
              Expanded(child: ElevatedButton(onPressed: (){
                setState(() {
                  searchType=0;
                });
              }, style: ElevatedButton.styleFrom(
                backgroundColor:searchType==0?AppColors.primaryColor: AppColors.background,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  side: const BorderSide(color:AppColors.primaryColor), // Set the border color here
                ),
              ),
                  child: Text("بحث بإسم السوره",style: textStyleRegular(color:searchType==0? AppColors.white:AppColors.black,fontSize: AppSize.s16),))),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(AppSize.s20),
          child: TextFormField(
            controller: _controller,
            // initialValue: 'الب',
            autofocus:true ,
            // onTapOutside: (event){
            //   FocusManager.instance.primaryFocus?.unfocus();
            // },
            style:textStyleRegular(color: AppColors.gray),
            textDirection: TextDirection.rtl,
            onTap: _setCursor,
            onChanged: (value)=>_runFilterForAyah(value,quran),
            decoration:  InputDecoration(
              // labelText:"بحث" ,

              label: Text("بحث",textAlign: TextAlign.end,style: textStyleRegular(color: AppColors.gray,fontSize: AppSize.s16), ),
              // suffixIcon: const Icon(Icons.search_outlined),
            ),
          ),
        ),
        searchType==0?indexCreator(quran, context):indexCreatorForAyah(quran, context),
      ],
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
    setState(() {
      allSura=result;
      _controller.text = enter;
      _textSelection = _controller.selection;
    });
  }

  Widget indexCreator(quran, context) {
    // controller.text="الب";
    // _runFilterForAyah("الله",quran);
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context,index){
          return  Container(
            color: index % 2 == 0
                ? AppColors.backgroundLight
                : AppColors.background,
            child: TextButton(
              child: Row(
                children: [
                  ArabicSuraNumber(i:int.parse( allSura[index]['surah']) ),
                  const Spacer(),
                  Text(
                    allSura[index]['name'],
                    style:textStyleRegular(fontSize: AppSize.s30,color: AppColors.black),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              onPressed: () {
                fabIsClicked = false;
                AppNavigator.push(context: context, screen:SurahBuilder(
                  arabic: quran[0],
                  sura:int.parse( allSura[index]['surah']),
                  suraName: allSura[index]['name'],
                  ayah: 0,
                ));
              },
            ),
          );
        },
        itemCount: allSura.length,
        separatorBuilder: (BuildContext context, int index) {  return Container(height: 2,color: AppColors.gray,);},
      ),
    );
  }

  void _runFilterForAyah(String enter,quran){
    List<dynamic>result=[];
    // if(enter.isEmpty){
    //   result=arabicName;
    // }
    // else
      {
        print("result=");
        print(quran[0][0]["aya_text_emlaey"].contains(enter));
        result = quran[0]
            .where((element)  {return element["aya_text_emlaey"].contains(enter)? true : false;})
            .toList();
      // result = quran[0]
      //     .where((element) => element["aya_text_emlaey"].contains(enter)).toList();
          // element["name"].contains(enter))
          // .toList();
      // result.forEach((element) {
      //   print(element);
      // });
      // result= arabicName.where((element) => element[0]["name"].contains(enter.toLowerCase()));
    }
    setState(() {
      allAyah=result;
      _controller.text = enter;
      _textSelection = _controller.selection;
    });
  }
  Widget indexCreatorForAyah(quran, context) {
    // controller.text="الب";
    // _runFilterForAyah("الله",quran);
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context,index){
          return  Container(
            color: index % 2 == 0
                ? AppColors.backgroundLight
                : AppColors.background,
            child: TextButton(
              child: Row(
                children: [
                  // ArabicSuraNumber(i:int.parse( allAyah[index]['surah']) ),
                  const Spacer(),
                  Text(
                    allAyah[index]['aya_text'],
                    style:textStyleRegular(fontSize: AppSize.s30,color: AppColors.black),
                    textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.start,

                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              onPressed: () {
                fabIsClicked = false;
                AppNavigator.push(context: context, screen:SurahBuilder(
                  arabic: quran[0],
                  sura:allAyah[index]['sura_no'],
                  suraName: allAyah[index]['sura_name_ar'],
                  ayah:allAyah[index]['aya_no'] ,
                ));
              },
            ),
          );
        },
        itemCount: allAyah.length,
        separatorBuilder: (BuildContext context, int index) {  return Container(height: 2,color: AppColors.gray,);},
      ),
    );
  }

}





