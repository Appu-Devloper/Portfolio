import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle({
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w600,
  Color color = Colors.black,
}) {
  return GoogleFonts.shantellSans(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
  
}
