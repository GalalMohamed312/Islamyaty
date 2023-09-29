import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

import '../../../cubit/Cubit.dart';
import '../../../cubit/states.dart';
import '../../utils/constants.dart';
import '../../utils/font_manager.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Settings",
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                         Text(
                          'Arabic Font Size:',
                          style: textStyleBold(fontSize:  AppSize.s16),
                        ),
                        Slider(
                          value: arabicFontSize,
                          min: AppSize.s20,
                          max:AppSize.s40,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.gray,
                          onChanged: (value){
                            setState(() {
                              arabicFontSize = value;
                            });
                          },
                        ),

                        Text(
                          "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                            textDirection: TextDirection.rtl,
                          style:textStyleRegular(fontSize: arabicFontSize)
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(),
                        ),
                         Text(
                          'Mushaf Mode Font Size:',
                          style:textStyleBold(fontSize:AppSize.s16)
                        ),
                        Slider(
                          value: mushafFontSize,
                          min: AppSize.s20,
                          max: AppSize.s40,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.gray,
                          onChanged: (value){
                            setState(() {
                              mushafFontSize=value;
                            });
                          },
                        ),

                        Text(
                          "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                          textDirection: TextDirection.rtl,
                          style:textStyleRegular(fontSize:mushafFontSize)),

                        const SizedBox(
                          height:AppSize.s20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    arabicFontSize=28;
                                    mushafFontSize=40;
                                  });
                                  cubit.saveSettings();
                                },
                                child: const Text('Reset')),
                            ElevatedButton(
                                onPressed: (){
                                  cubit.saveSettings();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Save')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
