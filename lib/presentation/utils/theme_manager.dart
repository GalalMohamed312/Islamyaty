
import 'package:flutter/material.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

ThemeData themeData(){
  return ThemeData(
  //  main color
    backgroundColor: AppColors.background,
    indicatorColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    primaryColorLight:  AppColors.amber,
    primaryColorDark:  AppColors.darkGray,
    disabledColor:  AppColors.gray,
  splashColor: AppColors.primaryColor,
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.background
  ),
  //icon theme
  iconTheme:const IconThemeData(
    color: AppColors.primaryColor,

  ) ,
  //  card view theme
    cardTheme: const CardTheme(
      color: AppColors.yellow,
      shadowColor: AppColors.gray,
      elevation: AppSize.s2
    ),
    //app bar theme
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      color: AppColors.primaryColor,
      elevation: AppSize.s2,
      shadowColor: AppColors.gray,
      titleTextStyle: textStyleBold(color: AppColors.white,fontSize: AppSize.s30),
    ),
    //button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),//his border like circle
      disabledColor: AppColors.gray,
      buttonColor: AppColors.primaryColor,
      splashColor: AppColors.lightPrimary,
    ),

    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textStyleRegular(color: AppColors.black,
        fontSize: AppSize.s16,

        ),
        primary: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
      ),
    ),
  //  text theme
    textTheme: TextTheme(
      displayLarge: textStyleRegular(color: AppColors.darkGray,
      fontSize: AppSize.s16
      ),
      displayMedium:  textStyleRegular(color: AppColors.darkGray,
          fontSize: AppSize.s14
      ),
      displaySmall:  textStyleRegular(color: AppColors.darkGray,
          fontSize: AppSize.s12
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
        labelStyle:  textStyleRegular(color: AppColors.yellow,fontSize: AppSize.s14),
        errorStyle:  textStyleRegular(color: AppColors.red,fontSize: AppSize.s14),
        hintStyle: textStyleRegular(color: AppColors.yellow,fontSize: AppSize.s14),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red  ,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    )
  );
}