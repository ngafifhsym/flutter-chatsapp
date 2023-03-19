import 'dart:ui';

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
