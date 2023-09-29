
import 'package:flutter/cupertino.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/font_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

TextStyle _textStyle({required double fontSize, required FontWeight fontWeight, required Color color,required String fontFamily}){
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
    fontFamily: FontConstant.fontFamily,
  );
}

TextStyle textStyleRegular({double fontSize=AppSize.s12, Color color=AppColors.black,fontFamily= FontConstant.fontFamily}){
  return _textStyle( fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color, fontFamily: fontFamily);
}
TextStyle textStyleMedium({double fontSize=AppSize.s12, Color color=AppColors.black,fontFamily= FontConstant.fontFamily}){
  return _textStyle( fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color, fontFamily: fontFamily);
}
TextStyle textStyleSemiBold({double fontSize=AppSize.s12, Color color=AppColors.black,fontFamily= FontConstant.fontFamily}){
  return _textStyle( fontSize: fontSize, fontWeight: FontWeightManager.semiBold, color: color, fontFamily: fontFamily);
}
TextStyle textStyleBold({double fontSize=AppSize.s12,Color color=AppColors.black,fontFamily= FontConstant.fontFamily}){
  return _textStyle( fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color, fontFamily: fontFamily);
}