
import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/font_manager.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData(){
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.secondaryColor,
    ),
    fontFamily: MyFont.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}