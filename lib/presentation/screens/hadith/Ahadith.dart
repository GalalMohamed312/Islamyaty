
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamyat/presentation/screens/hadith/showHadith.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/navigator.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

import '../../../data/db/mydata.dart';
import '../../../model/hadithe.dart';
import '../../utils/app_strings.dart';
import '../../utils/assets.dart';

class AllAhadithScreen extends StatefulWidget {
  const AllAhadithScreen({super.key});

  @override
  State<AllAhadithScreen> createState() => _AllAhadithScreenState();
}

class _AllAhadithScreenState extends State<AllAhadithScreen> {


  Widget hadithCard(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(ImageAssets.hadithWindow),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(key,style:textStyleBold(fontSize: AppSize.s16,color: AppColors.lightBlack),),
            Text(name,
              style:textStyleBold(fontSize: AppSize.s24,color: AppColors.primaryColor),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            ],
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(// centerTitle: true,
        title: TextApp.topHomeScreen,
      ),
      backgroundColor: AppColors.background,
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              FutureBuilder(
                //we call the method, which is in the folder db file database.dart
                  future: MyData.getAllData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Hadith item = snapshot.data[index];
                          //delete one register for id
                          return GestureDetector(
                              onTap: (){
                                AppNavigator.push(context: context, screen: ViewHadith(hadith: item,));
                              },
                              child: hadithCard('${item.key}', item.nameHadith));
                        },
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3/2,),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
