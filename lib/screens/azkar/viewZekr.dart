import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamyat/model/azkarModel.dart';
import 'package:share_plus/share_plus.dart';

import '../../cubit/Cubit.dart';
import '../../cubit/states.dart';
import '../../model/hadithe.dart';
import '../../utils/navigator.dart';
import '../hadith/convertHadithStyle.dart';


class ViewZekr extends StatelessWidget{
  final  azkarModel;

  ViewZekr({super.key, required this.azkarModel});

  Widget build(BuildContext context) {

    return Scaffold(
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Text(azkarModel['description'],
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
                Text(azkarModel['category'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.tajawal(fontWeight: FontWeight.bold,fontSize: 25.0),),
                const SizedBox(height: 20,),
                convertHadith(context,azkarModel['zekr']),
                const SizedBox(height: 20,),

              ],
            ),
          ),
        ));
  }
}

