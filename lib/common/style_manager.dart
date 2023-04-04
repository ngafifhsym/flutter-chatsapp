import 'dart:ui';

import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _setTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins()
      .copyWith(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getWhite24BoldTextStyle({
  double fontSize = 24,
  FontWeight fontWeight = FontWeightManager.bold
}){
  return _setTextStyle(fontSize, fontWeight, Colors.white);
}

TextStyle getWhite12RegularTextStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeightManager.regular
}){
  return _setTextStyle(fontSize, fontWeight, Colors.white);
}

TextStyle getWhite10RegularTextStyle({
  double fontSize = 10,
  FontWeight fontWeight = FontWeightManager.regular
}){
  return _setTextStyle(fontSize, fontWeight, Colors.white);
}

TextStyle getWhite14RegularTextStyle({
  double fontSize = 14,
  FontWeight fontWeight = FontWeightManager.regular
}){
  return _setTextStyle(fontSize, fontWeight, Colors.white);
}

TextStyle getPrimary14RegularTextStyle({
  double fontSize = 14,
  FontWeight fontWeight = FontWeightManager.regular
}){
  return _setTextStyle(fontSize, fontWeight, ColorManager.primaryColor);
}
TextStyle getPrimary10RegularTextStyle({
  double fontSize = 10,
  FontWeight fontWeight = FontWeightManager.regular
}){
  return _setTextStyle(fontSize, fontWeight, ColorManager.primaryColor);
}

TextStyle getWhite16SemiBoldTextStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeightManager.semiBold
}){
  return _setTextStyle(fontSize, fontWeight, Colors.white);
}
