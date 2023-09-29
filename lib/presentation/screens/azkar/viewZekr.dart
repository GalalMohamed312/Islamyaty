import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamyat/model/azkarModel.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/navigator.dart';
import '../hadith/convertHadithStyle.dart';


class ViewZekr extends StatelessWidget{
  final AzkarModel azkarModel;

  ViewZekr({super.key, required this.azkarModel});

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Text("",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.tajawal(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          AppNavigator.pop(context: context);
                        },
                        child: const Icon(Icons.arrow_forward_ios,weight: 40,)),

                  ],
                ),
                const SizedBox(height: 20,),
                Text(azkarModel.category!,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.tajawal(fontWeight: FontWeight.bold,fontSize: 25.0),),
                const SizedBox(height: 20,),
                convertHadith(context,azkarModel.zekr!),
                const SizedBox(height: 20,),

              ],
            ),
          ),
        ));
  }
}

